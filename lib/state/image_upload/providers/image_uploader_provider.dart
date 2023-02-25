import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/image_upload/notifiers/image_upload_notifier.dart';
import 'package:instagram_clone/state/image_upload/typedefs/is_loading.dart';

final imageUploaderProvider =
    StateNotifierProvider<ImageUploadNotifier, IsLoading>((ref) {
  return ImageUploadNotifier();
});
