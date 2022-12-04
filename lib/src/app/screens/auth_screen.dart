import 'package:flutter/material.dart';

import '../../features/auth/module.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Auth screen'),
        ),
        body: context.watchAuthInfo().map(
              authenticated: (info) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(info.name),
                    const LogoutButton(),
                  ],
                ),
              ),
              anonymous: (_) => const RegisterForm(),
              registered: (info) => SizedBox(),
              error: (info) => Center(
                child: Text(info.error),
              ),
            ),
      );
}
