import 'package:instagram_clone/state/image_upload/models/file_type.dart';

extension CollectionNameFromFileType on FileType {
  String get collectionNameFromFileType {
    switch (this) {
      case FileType.image:
        return 'images';
      case FileType.video:
        return 'videos';
    }
  }
}
