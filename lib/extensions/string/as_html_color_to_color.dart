import 'package:flutter/material.dart';
import 'package:instagram_clone/extensions/string/remove_all.dart';

// convert 0x?????? or #?????? to Color
extension AsHtmlColorToColor on String {
  Color htmlColorToColor() => Color(
        int.parse(
          removeAll(['0x', '#']).padLeft(8, 'ff'),
          radix: 16,
        ),
      );
}
