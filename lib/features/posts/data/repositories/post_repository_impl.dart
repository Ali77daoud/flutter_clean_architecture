import 'package:clean_archeticture/core/error/exception.dart';
import 'package:clean_archeticture/core/network/network_info.dart';
import 'package:clean_archeticture/features/posts/data/datasources/post_local_datasource.dart';
import 'package:clean_archeticture/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:clean_archeticture/features/posts/data/models/post_model.dart';
import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:clean_archeticture/core/error/failure_error.dart';
import 'package:clean_archeticture/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

typedef DeleteOrupdateOradd = Future<Unit> Function();

class PostsRepositoryImp implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostslocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImp({required this.remoteDataSource,required this.localDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{
    //remote
    if(await networkInfo.isConnected){

      try{
        final remotePosts = await remoteDataSource.getAllPosts();
        //cach the data
        localDataSource.cachPosts(remotePosts);

        return Right(remotePosts);
      }on ServerException{
        return Left(ServerFailure());
      }
      
    }
    //local
    else{
      try{
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);

      }on EmptyCachException{
        return Left(EmptyCachFailure());
      }
      
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async{
    //convert to postmodel
    final PostModel postModel = PostModel(title: post.title, body: post.body);

    // if(await networkInfo.isConnected){
    //   try{
    //     await remoteDataSource.addPost(postModel);
    //     return const Right(unit);

    //   }on ServerException{
    //     return Left(ServerFailure());
    //   }
    // }else{
    //   return Left(OffLineFailure());
    // }
    return await validateAddDeleteUpdatePost(() => remoteDataSource.addPost(postModel));

  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async{
    final PostModel postModel = PostModel(id: post.id, title: post.title, body: post.body);

    // if(await networkInfo.isConnected){
    //   try{
    //     await remoteDataSource.updatePost(postModel);
    //     return const Right(unit);

    //   }on ServerException{
    //     return Left(ServerFailure());
    //   }
    // }else{
    //   return Left(OffLineFailure());
    // }
    return await validateAddDeleteUpdatePost(() => remoteDataSource.updatePost(postModel));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async{
    // if(await networkInfo.isConnected){
    //   try{
    //     await remoteDataSource.deletePost(id);
    //     return const Right(unit);

    //   }on ServerException{
    //     return Left(ServerFailure());
    //   }
    // }else{
    //   return Left(OffLineFailure());
    // }
    return await validateAddDeleteUpdatePost(() => remoteDataSource.deletePost(id));
  }

  Future<Either<Failure, Unit>> validateAddDeleteUpdatePost(DeleteOrupdateOradd deleteOrupdateOradd )async{
    if(await networkInfo.isConnected){
      try{
        await deleteOrupdateOradd();
        return const Right(unit);

      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OffLineFailure());
    }
  }
 
}
