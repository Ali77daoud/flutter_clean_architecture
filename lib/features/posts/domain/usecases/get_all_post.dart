import 'package:clean_archeticture/core/error/failure_error.dart';
import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:clean_archeticture/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase {
  final PostRepository repository;

  GetAllPostsUseCase(this.repository);

  Future <Either<Failure , List<Post> > > call() async {
    return await repository.getAllPosts();
  }

}


