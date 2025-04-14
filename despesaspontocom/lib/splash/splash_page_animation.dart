import 'package:flutter/material.dart';

class SplashPageAnimation {
  final AnimationController controller;
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  SplashPageAnimation({
    required this.controller,
  })  : fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        ),
        scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        );
}