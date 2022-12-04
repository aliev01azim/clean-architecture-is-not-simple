import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../di.dart';
import 'src/presentation/bloc/auth_bloc.dart';
import 'src/presentation/widgets/auth_failure_notifier.dart';

export '../../core/extensions/auth_ext.dart';
export 'src/presentation/widgets/login_form.dart';
export 'src/presentation/widgets/logout_button.dart';

class AuthModule extends SingleChildStatelessWidget {
  const AuthModule({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => MultiProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => di<AuthBloc>()..add(const AuthEvent.init()),
          ),
          const AuthFailureNotifier(),
        ],
        child: child,
      );
}
