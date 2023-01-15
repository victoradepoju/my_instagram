import 'package:instagram_clone/views/components/animations/lottie_animation_view.dart';
import 'package:instagram_clone/views/components/animations/models/lottie_animation.dart';

class EmptyContentsAnimatonView extends LottieAnimationView {
  const EmptyContentsAnimatonView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
