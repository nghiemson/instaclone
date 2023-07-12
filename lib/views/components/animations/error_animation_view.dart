import 'lottie_animation_view.dart';
import 'model/lottie_animation.dart';

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({super.key})
      : super(
    animation: LottieAnimation.error,
    reverse: true,
  );
}