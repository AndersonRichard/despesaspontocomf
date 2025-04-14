import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Despesas',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.login, // Definiremos isso depois
      routes: AppRoutes.routes, // Definiremos isso depois
      debugShowCheckedModeBanner: false,
    );
  }
}