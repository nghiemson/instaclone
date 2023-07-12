import 'package:flutter/material.dart';

import 'lottie_animation_view.dart';
import 'model/lottie_animation.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  const EmptyContentsAnimationView({super.key})
      : super(
    animation: LottieAnimation.empty,
  );
}