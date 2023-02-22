import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/post_settings/models/post_setting.dart';

class PostSettingsNotifier extends StateNotifier<Map<PostSetting, bool>> {
  PostSettingsNotifier()
      : super(
          UnmodifiableMapView(
            {
              // this sets the settings to true by default
              for (final setting in PostSetting.values) setting: true,
            },
          ),
        );

  void setSetting(
    PostSetting setting,
    bool value,
  ) {
    final existingValue = state[setting];
    // first case would be strange since we already gave it a value in our
    // statenotifier. second case is if the setting is not changed.
    if (existingValue == null || existingValue == value) {
      // don't change anything
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[setting] = value,
    );
  }
}
