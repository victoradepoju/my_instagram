import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram_clone/state/auth/constants/constants.dart';
import 'package:instagram_clone/state/auth/models/auth_result.dart';
import 'package:instagram_clone/state/posts/typedefs/user_id.dart';

class Authenticator {
  const Authenticator();

  // User? get currentUser => FirebaseAuth.instance.currentUser;

  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  // if you have current user id then you're already logged in
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }

  Future<AuthResult> loginWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();
    final token = loginResult.accessToken?.token;
    if (token == null) {
      // user has aborted the logging in process
      return AuthResult.aborted;
    }

    final oAuthCredential = FacebookAuthProvider.credential(token);
    try {
      // Yes we've signed in with facebook but not yet with firebase. Done here
      await FirebaseAuth.instance.signInWithCredential(oAuthCredential);

      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      // in case the same credential is attempted for both facebook and google,
      final email = e.email;
      final credential = e.credential;
      if (e.code == Constants.accountExistsWithDifferentCredential &&
          email != null &&
          credential != null) {
        final providers =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(
          email,
        );
        if (providers.contains(Constants.googleCom)) {
          await loginWithGoogle();
          FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
        }
        return AuthResult.success;
      }
      return AuthResult.failure;
    }
  }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        Constants.emailScope,
      ],
    );

    // this will display the google sigin in dialog
    final signInAccout = await googleSignIn.signIn();
    if (signInAccout == null) {
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccout.authentication;
    final oAuthCredentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(oAuthCredentials);
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
