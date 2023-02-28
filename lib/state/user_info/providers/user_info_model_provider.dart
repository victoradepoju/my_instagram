// a stream, so it requires no statenotifer or
// statenotifier provider

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/constants/firebase_collection_name.dart';
import 'package:instagram_clone/state/constants/firebase_field_name.dart';
import 'package:instagram_clone/state/posts/typedefs/user_id.dart';
import 'package:instagram_clone/state/user_info/models/user_info_model.dart';

// UserInfoModel is the output
// UserId is the input

final userInfoModelProvider = StreamProvider.family
    .autoDispose<UserInfoModel, UserId>((ref, UserId userId) {
  // when using StreamProviders, it is usually preferrable to
  // first create a StreamController for it and then retun
  // the controller's stream as the result of the provider, and
  // upon the ref getting disposed off, the controler is also
  // disposed off
  final controller = StreamController<UserInfoModel>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionName.users)
      .where(
        FirebaseFieldName.userId,
        isEqualTo: userId,
      )
      .limit(1)
      .snapshots()
      .listen(
    (snapshot) {
      final doc = snapshot.docs.first;
      final json = doc.data();
      final userInfoModel = UserInfoModel.fromJson(
        json,
        userId: userId,
      );
      controller.add(userInfoModel);
    },
  );

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
