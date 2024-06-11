import 'package:animations/explicitas/explicitas_screen.dart';
import 'package:animations/home/home_screen.dart';
import 'package:animations/implicitas/implicitas_screen.dart';
import 'package:animations/implicitas/splash_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      name: "home",
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          name: ImplicitasScreen.name,
          path: ImplicitasScreen.name,
          builder: (context, state) => const ImplicitasScreen(),
        ),
        GoRoute(
          name: SplashScreen.name,
          path: SplashScreen.name,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: ExplecitasScreen.name,
          path: ExplecitasScreen.name,
          builder: (context, state) => const ExplecitasScreen(),
        ),
      ],
    ),
  ],
);
