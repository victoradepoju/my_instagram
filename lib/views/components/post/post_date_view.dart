// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostDateView extends StatelessWidget {
  final DateTime dateTime;

  const PostDateView({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('d MMMM, yyyy, hh:mm a');
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
      ),
      child: Text(
        formatter.format(
          dateTime,
        ),
      ),
    );
  }
}
