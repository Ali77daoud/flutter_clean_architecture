import 'package:clean_archeticture/core/app_theme.dart';
import 'package:clean_archeticture/core/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/theme/them_bloc_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'injection_container.dart' as de;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //for the init function
  await de.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => de.sl<PostsBloc>()..add(GetAllPostEvent())),
          BlocProvider(create: (_) => de.sl<AddDeleteUpdatePostBloc>()),
          BlocProvider(create: (_) => de.sl<ThemBlocBloc>())
        ],
        child:
            BlocBuilder<ThemBlocBloc, ThemBlocState>(builder: (context, state) {
          SharedPreferences sh = de.sl();
          bool isDark = sh.getBool('isDark') ?? false;

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: isDark ? appDarkTheme : appTheme,
            routerDelegate: _appRouter.delegate(),      
            routeInformationParser: _appRouter.defaultRouteParser(),

          );
        }));
  }
}
