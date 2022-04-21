import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 800),
    this.child,
    this.offset = 140.0,
    this.curve = Curves.fastOutSlowIn,
    this.offsetDirection = Axis.vertical,
  }) : super(key: key);

  final Widget? child;
  final Duration duration;
  final double offset;
  final Curve curve;
  final Axis offsetDirection;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: 1, end: 0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: offsetDirection == Axis.horizontal ? Offset(value * offset, 0) : Offset(0, value * offset),
          child: child,
        );
      },
      child: child,
    );
  }
}

class OpacityAnimation extends StatelessWidget {
  const OpacityAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 1000),
    this.child,
    this.curve = Curves.ease,
    this.begin = 0.0,
    this.end = 1.0,
  }) : super(key: key);

  final Widget? child;
  final Duration duration;
  final Curve curve;
  final double begin;
  final double end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: begin, end: end),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class ScaleAnimation extends StatelessWidget {
  const ScaleAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 800),
    this.child,
    this.curve = Curves.fastOutSlowIn,
    this.initScale = 0.0,
    this.finalScale = 1.0,
  }) : super(key: key);

  final Widget? child;
  final Duration duration;
  final double initScale;
  final double finalScale;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: initScale, end: finalScale),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(
        AniProps.translateY,
        Tween(begin: -30.0, end: 0.0),
        const Duration(milliseconds: 500),
        Curves.easeOut,
      );

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AniProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}
