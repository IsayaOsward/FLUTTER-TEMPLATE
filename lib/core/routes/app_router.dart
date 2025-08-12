import 'package:go_router/go_router.dart';

import '../../features/authentication/routes/auth_router.dart';
import 'route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.login,
  routes: [
    // HII NI ROUTE GENERAL HAITEGEMEI APP LEVEL ACCESS
    // GoRoute(
    //   path: RoutePaths.splash,
    //   builder: (context, state) => const SplashScreenPage(),
    // ),

    // APP LEVEL ROUTING ZINAANDIKWA HIVI
    ...authRoutes,
  ],
);
