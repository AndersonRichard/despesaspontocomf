// lib/screens/login/login_screen.dart
import 'package:despesaspontocom/animations/splash_animation/splash_animated_text.dart';
import 'package:despesaspontocom/animations/splash_animation/splash_entrance_animation.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final SplashEntranceAnimation _animation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = SplashEntranceAnimation(_controller);
    
    _controller.forward().then((_) {
      // Opcional: Navegar para a próxima tela após a animação
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.darkBlue, AppColors.grayishBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SplashAnimatedText(animation: _animation),
        ),
      ),
    );
  }
}