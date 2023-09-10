// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({super.key, required this.delay, required this.child});
  @override
  Widget build(BuildContext context) {
    final Tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
      ..add(AniProps.translateY, (-30.0).tweenTo(1.0), 500.milliseconds,
          Curves.easeOut);
    return PlayAnimation<MultiTweenValues<AniProps>>(
      duration: Tween.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(AniProps.opacity),
          child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY)),
            child: child,
          ),
        );
      },
      tween: Tween,
      child: child,
    );
  }
}
