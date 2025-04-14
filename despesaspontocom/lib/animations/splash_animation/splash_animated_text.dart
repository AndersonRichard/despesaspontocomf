import 'package:flutter/material.dart';
import 'splash_entrance_animation.dart';

class SplashAnimatedText extends StatelessWidget {
  final SplashEntranceAnimation animation;

  const SplashAnimatedText({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.translateY.value),
          child: Transform.scale(
            scale: animation.scale.value,
            child: Opacity(
              opacity: animation.opacity.value,
              child: Text(
                'Despesas.com',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ],
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}