import 'package:clean_archeticture/core/error/failure_error.dart';
import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository{

  Future <Either<Failure , List<Post> > > getAllPosts();

  Future <Either<Failure , Unit >> deletePost(int id);

  Future <Either<Failure , Unit >> updatePost(Post post);

  Future <Either<Failure , Unit >> addPost(Post post);
}

