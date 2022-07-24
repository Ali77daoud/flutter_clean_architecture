import 'package:auto_route/auto_route.dart';
import 'package:clean_archeticture/features/posts/presentation/pages/post_add_update.dart';
import 'package:clean_archeticture/features/posts/presentation/pages/post_detail_page.dart';
import 'package:clean_archeticture/features/posts/presentation/pages/postspage.dart';


@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
      page: PostsPage,
      path: '/',
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideRight,
    ),
    CupertinoRoute(
        page: PostDetailPage,
        // transitionsBuilder: TransitionsBuilders.slideRight,
        // durationInMilliseconds: 500,
        path: '/second'),
    // AutoRoute(
    //   page: SecondPage,
    //   path: '/second',
    // ),
    CustomRoute(
      page: PostAddUpdatePage,
      path: '/third',
    
    ),
  ],
)
class $AppRouter {}
