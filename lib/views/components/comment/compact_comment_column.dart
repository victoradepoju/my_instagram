// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:instagram_clone/state/comments/models/comment.dart';
import 'package:instagram_clone/views/components/comment/compact_comment_tile.dart';

class MyWidget extends StatelessWidget {
  final Iterable<Comment> comments;
  const MyWidget({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 8.0,
        right: 8.0,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: comments.map(
            (comment) {
              return CompactCommentTile(
                comment: comment,
              );
            },
          ).toList()),
    );
  }
}
