
import 'package:go_router/go_router.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/bienvenida',
  routes: [
    GoRoute(
      path: '/bienvenida',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
