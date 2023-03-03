// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:instagram_clone/state/posts/models/post.dart';
import 'package:instagram_clone/views/components/post/posts_thumbnail_view.dart';
import 'package:instagram_clone/views/post_comments/post_comments_view.dart';

class PostsGridView extends StatelessWidget {
  final Iterable<Post> posts;
  const PostsGridView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        // use elementAt for iterables, not posts[index] which is for lists
        final post = posts.elementAt(index);
        return PostThumbnailView(
          post: post,
          onTapped: () {
            // TODO: remove this code before we go to details view
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PostCommentsView(
                  postId: post.postId,
                ),
              ),
            );
            // TODO: navigate to the post detail page
          },
        );
      },
    );
  }
}
