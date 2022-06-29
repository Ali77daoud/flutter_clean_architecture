import 'package:bloc/bloc.dart';
import 'package:clean_archeticture/core/error/failure_error.dart';
import 'package:clean_archeticture/core/strings/error.dart';
import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:clean_archeticture/features/posts/domain/usecases/get_all_post.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;

  PostsBloc({ required this.getAllPosts }) : super(PostsInitial()) {
    
    on<PostsEvent>((event, emit) async{
      if(event is GetAllPostEvent  || event is RefreshPostEvent){
        emit(LoadingPostsState());

        final failureOrPosts = await getAllPosts.call();

        failureOrPosts.fold(
          (failure) {
            emit(ErrorPostsState(message: failureMessage(failure)));
          }, 
          (posts) {
            emit(LoadedPostsState(posts: posts));
          },
          );

      }
    });
  }

  //function to know the type of failure
  String failureMessage(Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure :
        return serverErrorMessage;
      case EmptyCachFailure :
        return cachErrorMessage;  
      case OffLineFailure :
        return noInternetErrorMessage;  
      default:
        return 'un Expected error , please try again later';
    }
  }
}
