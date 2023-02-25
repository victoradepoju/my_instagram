import 'dart:io';

import 'package:image_picker/image_picker.dart';

// This is because The image_picker package returns gallery images
// in XFile format

extension ToFile on Future<XFile?> {
  Future<File?> toFile() => then((xFile) => xFile?.path).then(
        (filePath) => filePath != null ? File(filePath) : null,
      );
}
