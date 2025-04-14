import 'package:flutter/material.dart';

class SplashEntranceAnimation {
  final AnimationController controller;

  late final Animation<double> opacity;
  late final Animation<double> scale;
  late final Animation<double> translateY;

  SplashEntranceAnimation(this.controller) {
    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    scale = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.8, curve: Curves.elasticOut),
      ),
    );

    translateY = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.decelerate),
      ),
    );
  }

  void dispose() {
    controller.dispose();
  }
}