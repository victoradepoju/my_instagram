import 'package:instagram_clone/views/components/animations/lottie_animation_view.dart';
import 'package:instagram_clone/views/components/animations/models/lottie_animation.dart';

class LoadingAnimatonView extends LottieAnimationView {
  const LoadingAnimatonView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}
