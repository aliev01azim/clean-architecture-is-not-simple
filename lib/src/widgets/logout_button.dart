import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () => context.read<AuthBloc>().add(AuthLogoutEvent()),
        child: const Text('Log out'),
      );
}
