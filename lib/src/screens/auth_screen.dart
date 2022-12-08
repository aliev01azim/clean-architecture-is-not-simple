import 'package:flutter/material.dart';

import '../helpers/helpers.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Auth app'),
          actions: [
            IconButton(
              key: key,
              icon: const Icon(Icons.info),
              onPressed: () => showInfo(context, key,
                  'Сделал И логин И регистрацию. \n Есть проверка на интернет\n Присутствует вечное обновление токенов \n Кэширую юзера в хайв \n Вёрстки нет,код - более менее'),
            ),
            w10,
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const RegisterScreen(),
                  ),
                ),
                icon: const Icon(Icons.how_to_reg),
                label: const Text('Register'),
              ),
              h16,
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LoginScreen(),
                  ),
                ),
                icon: const Icon(Icons.login),
                label: const Text('Login'),
              ),
            ],
          ),
        ));
  }
}
