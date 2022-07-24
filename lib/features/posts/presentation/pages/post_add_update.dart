import 'package:auto_route/auto_route.dart';
import 'package:clean_archeticture/core/routes/routes.gr.dart';
import 'package:clean_archeticture/core/util/snackbarmessage.dart';
import 'package:clean_archeticture/core/widget/loadingwidget.dart';
import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:clean_archeticture/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:clean_archeticture/features/posts/presentation/pages/postspage.dart';
import 'package:clean_archeticture/features/posts/presentation/widgets/post_add_update_page/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostAddUpdatePage extends StatelessWidget {
  //if page is for update post
  final Post? post;
  final bool isUpdatePost;
  /////////////////////////////////
  const PostAddUpdatePage({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(isUpdatePost ? 'Update Post' : 'Add post'),
    );
  }

  Widget buildBody() {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
                  builder: (context, state) {
            if (state is LoadingAddDeleteUpdatePostState) {
              return const LoadingWidget();
            }
            return FormWidget(
                isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
          },
          listener: (context, state) {
            if (state is SuccessAddDeleteUpdatePostState) {
              SnackBarMessage().showSuccessSnackBar(
                  message: state.message, context: context);
              AutoRouter.of(context).pushAndPopUntil(const PostsRoute(), predicate: (route) => false);
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (_) => const PostsPage()),
              //     (route) => false);
            } else if (state is ErrorAddDeleteUpdatePostState) {
              SnackBarMessage()
                  .showErrorSnackBar(message: state.message, context: context);
            }
          })),
    );
  }
}
