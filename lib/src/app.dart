import 'package:auth/src/screens/login_screen.dart';
import 'package:auth/src/screens/success_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bloc/auth_bloc.dart';
import 'bloc/internet_cubit/internet_cubit.dart';
import 'helpers/helper.dart';
import 'repository/auth_repository.dart';
import 'screens/auth_screen.dart';

class App extends StatelessWidget {
  const App(
      {super.key,
      required this.connectivity,
      required this.registerRepository,
      required this.loginRepository});
  final Connectivity connectivity;
  final RegisterRepositoryImpl registerRepository;
  final LoginRepositoryImpl loginRepository;

  @override
  Widget build(BuildContext context) {
    final user = Hive.box('userBox').get('user', defaultValue: {});

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (_) => AuthBloc(
            registerRepository: registerRepository,
            loginRepository: loginRepository,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Builder(builder: (context) {
          return BlocListener<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is InternetDisconnectedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    bottomSnackBar('Отсутствует интернет!', true));
              }
            },
            child: user['accessToken'] == null
                ? const AuthScreen()
                : SuccessScreen(UserModel.fromJson(user)),
          );
        }),
      ),
    );
  }
}
