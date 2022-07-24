import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:clean_archeticture/features/posts/presentation/pages/post_detail_page.dart';
import 'package:flutter/material.dart';

class PostsListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostsListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(posts[index].id.toString()),
            title: Text(posts[index].title.toString()),
            subtitle: Text(posts[index].body.toString()),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PostDetailPage(post: posts[index])));
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 2,
          );
        },
        itemCount: posts.length);
  }
}
