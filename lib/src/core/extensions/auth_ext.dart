import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/src/presentation/bloc/auth_bloc.dart';
import '../../features/auth/src/domain/entities/auth_info/auth_info.dart';
import '../../features/auth/src/domain/entities/auth_status/auth_status.dart';

extension AuthExt on BuildContext {
  AuthInfo readAuthInfo() => read<AuthBloc>().state.info;
  AuthInfo watchAuthInfo() => watch<AuthBloc>().state.info;

  // AuthStatus readAuthStatus() => read<AuthBloc>().state.status;
  AuthStatus watchAuthStatus() => watch<AuthBloc>().state.status;

  bool watchAuthProcessing() =>
      watchAuthStatus().maybeMap(processing: (_) => true, orElse: () => false);
}
