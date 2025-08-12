// HIZI NI ZA SPECIFIC FEATURE

import 'package:go_router/go_router.dart';

import '../../../core/routes/route_paths.dart';
import '../presentation/pages/login_page.dart';

final List<GoRoute> authRoutes = [
  GoRoute(
    name: RoutePaths.login,
    path: RoutePaths.login,
    builder: (context, state) => const LoginPage(),
  ),
];
