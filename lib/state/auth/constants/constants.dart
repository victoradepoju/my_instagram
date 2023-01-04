import 'package:flutter/foundation.dart' show immutable;

@immutable
class Constants {
  static const accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';
  static const emailAlreadyInUse = 'email-already-in-use';
  static const googleCom = 'google.com';
  static const emailScope = 'email';

  // makes the constructor private so it cannot be initialized from outside
  const Constants._();
}
