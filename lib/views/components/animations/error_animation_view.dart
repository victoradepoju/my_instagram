import 'package:instagram_clone/views/components/animations/lottie_animation_view.dart';
import 'package:instagram_clone/views/components/animations/models/lottie_animation.dart';

class ErrorAnimatonView extends LottieAnimationView {
  const ErrorAnimatonView({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}
