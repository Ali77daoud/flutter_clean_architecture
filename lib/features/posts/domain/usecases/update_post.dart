import 'package:clean_archeticture/core/error/failure_error.dart';
import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:clean_archeticture/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase{
  final PostRepository repository;

  UpdatePostUseCase(this.repository);

  Future <Either<Failure , Unit >> call(Post post) async{
    return repository.updatePost(post);
  }
}