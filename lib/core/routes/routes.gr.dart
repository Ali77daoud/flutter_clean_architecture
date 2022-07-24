// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/posts/domain/entities/post.dart' as _i6;
import '../../features/posts/presentation/pages/post_add_update.dart' as _i3;
import '../../features/posts/presentation/pages/post_detail_page.dart' as _i2;
import '../../features/posts/presentation/pages/postspage.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PostsRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.PostsPage(),
          transitionsBuilder: _i4.TransitionsBuilders.slideRight,
          opaque: true,
          barrierDismissible: false);
    },
    PostDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailRouteArgs>();
      return _i4.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i2.PostDetailPage(key: args.key, post: args.post));
    },
    PostAddUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<PostAddUpdateRouteArgs>();
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.PostAddUpdatePage(
              key: args.key, post: args.post, isUpdatePost: args.isUpdatePost),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(PostsRoute.name, path: '/'),
        _i4.RouteConfig(PostDetailRoute.name, path: '/second'),
        _i4.RouteConfig(PostAddUpdateRoute.name, path: '/third')
      ];
}

/// generated route for [_i1.PostsPage]
class PostsRoute extends _i4.PageRouteInfo<void> {
  const PostsRoute() : super(name, path: '/');

  static const String name = 'PostsRoute';
}

/// generated route for [_i2.PostDetailPage]
class PostDetailRoute extends _i4.PageRouteInfo<PostDetailRouteArgs> {
  PostDetailRoute({_i5.Key? key, required _i6.Post post})
      : super(name,
            path: '/second', args: PostDetailRouteArgs(key: key, post: post));

  static const String name = 'PostDetailRoute';
}

class PostDetailRouteArgs {
  const PostDetailRouteArgs({this.key, required this.post});

  final _i5.Key? key;

  final _i6.Post post;
}

/// generated route for [_i3.PostAddUpdatePage]
class PostAddUpdateRoute extends _i4.PageRouteInfo<PostAddUpdateRouteArgs> {
  PostAddUpdateRoute({_i5.Key? key, _i6.Post? post, required bool isUpdatePost})
      : super(name,
            path: '/third',
            args: PostAddUpdateRouteArgs(
                key: key, post: post, isUpdatePost: isUpdatePost));

  static const String name = 'PostAddUpdateRoute';
}

class PostAddUpdateRouteArgs {
  const PostAddUpdateRouteArgs(
      {this.key, this.post, required this.isUpdatePost});

  final _i5.Key? key;

  final _i6.Post? post;

  final bool isUpdatePost;
}
