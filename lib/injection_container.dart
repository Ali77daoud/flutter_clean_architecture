import 'package:clean_archeticture/core/network/network_info.dart';
import 'package:clean_archeticture/features/posts/data/datasources/post_local_datasource.dart';
import 'package:clean_archeticture/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:clean_archeticture/features/posts/data/repositories/post_repository_impl.dart';
import 'package:clean_archeticture/features/posts/domain/repositories/post_repository.dart';
import 'package:clean_archeticture/features/posts/domain/usecases/add_post.dart';
import 'package:clean_archeticture/features/posts/domain/usecases/delete_post.dart';
import 'package:clean_archeticture/features/posts/domain/usecases/get_all_post.dart';
import 'package:clean_archeticture/features/posts/domain/usecases/update_post.dart';
import 'package:clean_archeticture/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:clean_archeticture/features/posts/presentation/bloc/theme/them_bloc_bloc.dart';
import 'package:clean_archeticture/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
// Feature post

  //bloc
  // maybe I need more than object from bloc (so I will use factory)

  sl.registerFactory(() => PostsBloc(getAllPosts: sl.call()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPostUseCase: sl.call(),
      updatePostUseCase: sl.call(),
      deletePostUseCase: sl.call()));
  sl.registerFactory(() => ThemBlocBloc());

  //usecases
  // I need just one object from it so I will use singleton

  sl.registerLazySingleton(() => GetAllPostsUseCase(sl.call()));
  sl.registerLazySingleton(() => AddPostUseCase(sl.call()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl.call()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl.call()));

  //repo
  sl.registerLazySingleton<PostRepository>(() => PostsRepositoryImp(
      remoteDataSource: sl.call(),
      localDataSource: sl.call(),
      networkInfo: sl.call()));

  //datasource
  sl.registerLazySingleton<PostslocalDataSource>(
      () => PostsLocalDataSourceImp(sharedPreferences: sl.call()));

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpWithHttp(client: sl.call()));
//core

  //networkS
  sl.registerLazySingleton<NetworkInfo>(() => NetworlInfoImp(sl.call()));
//external

  //shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  //http

  sl.registerLazySingleton(() => http.Client());

  //internet checker

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
