import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/post_settings/models/post_setting.dart';
import 'package:instagram_clone/state/post_settings/notifiers/post_settings_notifier.dart';

final postSettingsProvider =
    StateNotifierProvider<PostSettingsNotifier, Map<PostSetting, bool>>((ref) {
  return PostSettingsNotifier();
});
