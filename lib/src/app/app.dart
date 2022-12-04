import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/auth/module.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: (context, child) => MultiProvider(
          providers: const [
            AuthModule(),
            // какой то ещё модуль к примеру
          ],
          child: child,
        ),
      );
}

final _appRouter = AppRouter();
