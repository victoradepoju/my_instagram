// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone/state/comments/models/comment.dart';

import 'package:instagram_clone/state/posts/models/post.dart';

// The purpose of this class is to provide an object that contains
// both the post and its comment
@immutable
class PostWithComments {
  final Post post;
  final Iterable<Comment> comments;
  const PostWithComments({
    required this.post,
    required this.comments,
  });

  // IterableEquality so that
  // ['a', 'b'] is seen as equal to ['b', 'a']
  @override
  bool operator ==(covariant PostWithComments other) =>
      post == other.post &&
      const IterableEquality().equals(
        comments,
        other.comments,
      );

  @override
  int get hashCode => Object.hashAll([
        post,
        comments,
      ]);
}
