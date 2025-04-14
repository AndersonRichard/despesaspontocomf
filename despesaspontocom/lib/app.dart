import 'package:despesaspontocom/common/app_colors.dart';
import 'package:despesaspontocom/common/app_transitions.dart';
import 'package:despesaspontocom/home/home_page.dart';
import 'package:despesaspontocom/splash/splash_page.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despesas.com',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.darkBlue,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBlue,
          elevation: 0,
        ),
      ),
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return AppTransitions.fadeTransition(const SplashPage());
          case '/home':
            return AppTransitions.slideTransition(const HomePage());
          default:
            return AppTransitions.fadeTransition(const SplashPage());
        }
      },
    );
  }
}