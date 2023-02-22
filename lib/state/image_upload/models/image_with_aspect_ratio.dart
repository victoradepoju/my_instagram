// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class ImageWithAspectRatio {
  final Image image;
  final double aspectRatio;

  const ImageWithAspectRatio({
    required this.image,
    required this.aspectRatio,
  });
}
