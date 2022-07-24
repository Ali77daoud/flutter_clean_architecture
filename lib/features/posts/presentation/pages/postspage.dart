import 'package:auto_route/auto_route.dart';
import 'package:clean_archeticture/core/routes/routes.gr.dart';
import 'package:clean_archeticture/core/widget/loadingwidget.dart';
import 'package:clean_archeticture/features/posts/presentation/bloc/theme/them_bloc_bloc.dart';
import 'package:clean_archeticture/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:clean_archeticture/features/posts/presentation/widgets/postspage/messagedisplaywidget.dart';
import 'package:clean_archeticture/features/posts/presentation/widgets/postspage/postlistwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
      floatingActionButton: floatingbtn(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Posts'),
      actions: [
        IconButton(
            onPressed: () {
              BlocProvider.of<ThemBlocBloc>(context).add(ChangeThemeEvent());
            },
            icon: const Icon(Icons.change_circle_outlined)),

      ],
    );
  }

  Widget buildBody() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
          if (state is LoadingPostsState) {
            return const LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
                onRefresh: () => onRefreshInd(context),
                child: PostsListWidget(posts: state.posts));
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        }));
  }

  Future<void> onRefreshInd(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostEvent());
  }

  Widget floatingbtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        AutoRouter.of(context).push(PostAddUpdateRoute(isUpdatePost: false));

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (_) => const PostAddUpdatePage(
        //               isUpdatePost: false,
        //             )));
      },
      child: const Icon(Icons.add),
    );
  }
}
