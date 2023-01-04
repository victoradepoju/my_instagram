import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/state/posts/typedefs/user_id.dart';

class Authenticator {
  // User? get currentUser => FirebaseAuth.instance.currentUser;

  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  // if you have current user id then you're already logged in
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;
}
