import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';
import 'screens/auth_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthScreen,
      path: '/',
      initial: true,
    ),
  ],
)
class $Router {}

class AppRouter extends Router {}
