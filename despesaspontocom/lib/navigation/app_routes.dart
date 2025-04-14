import 'package:despesaspontocom/screens/login/login_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';

  static final routes = {
    login: (context) => const LoginScreen(), // Criaremos depois
   
  };
}