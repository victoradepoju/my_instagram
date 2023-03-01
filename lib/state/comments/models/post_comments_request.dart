// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' show immutable;

import 'package:instagram_clone/enums/date_sorting.dart';
import 'package:instagram_clone/state/posts/typedefs/post_id.dart';

@immutable
class RequestForPostAndComments {
  final PostId postId;
  final bool sortByCreatedAt;
  final DateSorting dateSorting;
  final int? limit;
  const RequestForPostAndComments({
    required this.postId,
    required this.sortByCreatedAt,
    required this.dateSorting,
    required this.limit,
  });

  @override
  // covariant just enforeces that the incoming other be of a type and
  // if not it throws an exception
  bool operator ==(covariant RequestForPostAndComments other) =>
      postId == other.postId &&
      sortByCreatedAt == other.sortByCreatedAt &&
      dateSorting == other.dateSorting &&
      limit == other.limit;

  @override
  int get hashCode => Object.hashAll(
        [
          postId,
          sortByCreatedAt,
          dateSorting,
          limit,
        ],
      );
}
