import 'package:bloc/bloc.dart';
import 'package:clean_archeticture/core/error/failure_error.dart';
import 'package:clean_archeticture/core/strings/error.dart';
import 'package:clean_archeticture/core/strings/success.dart';
import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:clean_archeticture/features/posts/domain/usecases/add_post.dart';
import 'package:clean_archeticture/features/posts/domain/usecases/delete_post.dart';
import 'package:clean_archeticture/features/posts/domain/usecases/update_post.dart';
import 'package:equatable/equatable.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUseCase addPostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;

  AddDeleteUpdatePostBloc(
      {required this.addPostUseCase,
      required this.updatePostUseCase,
      required this.deletePostUseCase})
      : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddDeleteUpdatePostState());

        final failureOrSuccessMessage = await addPostUseCase.call(event.post);

        failureOrSuccessMessage.fold((failure) {
          emit(ErrorAddDeleteUpdatePostState(message: failureMessage(failure)));
        }, (_) {
          emit(const SuccessAddDeleteUpdatePostState(
              message: addSuccsessMessage));
        });
        ///////////////////////////////////////////////////////////////////////
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeleteUpdatePostState());

        final failureOrSuccessMessage =
            await updatePostUseCase.call(event.post);

        failureOrSuccessMessage.fold((failure) {
          emit(ErrorAddDeleteUpdatePostState(message: failureMessage(failure)));
        }, (_) {
          emit(const SuccessAddDeleteUpdatePostState(
              message: updateSuccsessMessage));
        });
        ////////////////////////////////////////////////////////////////////////////
      } else if (event is DeletePostEvent) {
        
        emit(LoadingAddDeleteUpdatePostState());

        final failureOrSuccessMessage = await deletePostUseCase.call(event.postId);

        failureOrSuccessMessage.fold((failure) {
          emit(ErrorAddDeleteUpdatePostState(message: failureMessage(failure)));
        }, (_) {
          emit(const SuccessAddDeleteUpdatePostState(
              message: deleteSuccsessMessage));
        });
      }
    });
  }

  String failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverErrorMessage;
      case EmptyCachFailure:
        return cachErrorMessage;
      case OffLineFailure:
        return noInternetErrorMessage;
      default:
        return 'un Expected error , please try again later';
    }
  }
}
