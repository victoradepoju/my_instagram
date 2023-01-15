import 'package:flutter/material.dart' show immutable;

@immutable
class Strings {
  const Strings._();

  static const appName = 'My Instag!';
  static const welcomeToAppName = 'Welcome to ${Strings.appName}';
  static const youHaveNoPosts =
      'You have not made a post yet. Press either the video-upload or the photo-upload buttons at the top of the screen in order to upload your first post!';
  static const noPostsAvailable =
      "Nobody seems to have made any posts yet. Why don't you take the first step and upload your first post?!";
  static const enterYourSearchTerm =
      'Enter your search term in order to get started. You can search in the description of all posts available in the system';

  static const facebook = 'Facebook';
  static const facebookSignupUrl = 'https://www.facebook.com/signup';
  static const google = 'Google';
  static const googleSignupUrl = 'https://accounts.google.com/signup';
  static const logIntoYourAccount =
      'Log into your account using one of the options below.';
  static const comments = 'Comments';
  static const writeYourCommentHere = 'Write your comment here...';
  static const checkOutThisPost = 'Check out this post!';
  static const postDetails = 'Post Details';
  static const post = 'post';

  static const createNewPost = 'Create New Post';
  static const pleaseWriteYourMessageHere = 'Please write your message here';

  static const noCommentsYet =
      'Nobody has commented on this post yet. You can though, and be the first person who comments!';

  static const enterYourSearchTermHere = 'Enter your search term here';

  // login view rich text at bottom
  static const dontHaveAnAccount = "Don't have an account?\n";
  static const signUpOn = 'Sign up on ';
  static const orCreateAnAccountOn = 'or create an account on ';
}
