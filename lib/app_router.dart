import 'package:go_router/go_router.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/lugares_screen.dart';

final GoRouter router = GoRouter(
  // La app arranca SIEMPRE en el login (sin Drawer ni otras pantallas)
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/registro',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/bienvenida',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const PortfolioScreen(),
    ),
    GoRoute(
      path: '/lugares',
      builder: (context, state) => const LugaresScreen(),
    ),
  ],
);
