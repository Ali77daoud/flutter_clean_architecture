import 'package:clean_archeticture/core/error/failure_error.dart';
import 'package:clean_archeticture/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase{
  final PostRepository repository;

  DeletePostUseCase(this.repository);

  Future <Either<Failure , Unit >> call(int id) async{
    return repository.deletePost(id);
  }
}