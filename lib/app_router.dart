import 'package:go_router/go_router.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/portfolio_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/bienvenida',
  redirect: (context, state) {
    if (state.uri.path == '/') return '/bienvenida';
    return null;
  },
  routes: [
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
  ],
);