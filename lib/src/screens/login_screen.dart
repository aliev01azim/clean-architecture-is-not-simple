import 'package:auth/src/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../helpers/helper.dart';
import '../helpers/shortcasts.dart';
import '../widgets/fields.dart';
import 'auth_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _email = '';
  void _handleSubmit() {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    form.save();

    context.read<AuthBloc>().add(AuthLoginEvent(
          password: _password,
          email: _email,
        ));
  }

  final GlobalKey key = GlobalKey();

  void _handlePasswordSaved(String? v) => _password = v ?? '';
  void _handleEmailSaved(String? v) => _email = v ?? '';
  @override
  Widget build(BuildContext context) {
    final isProcessing = context.watch<AuthBloc>().state is AuthLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            key: key,
            icon: const Icon(Icons.info),
            onPressed: () => showInfo(context, key,
                'Я бы мог заполнить эти поля \n если они уже имеются. \n Но не стал,наверное так логичней. \n Поставил сюда логоут на всякий \n Если вы забудете данные'),
          ),
          w10,
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(bottomSnackBar(state.error));
          }
          if (state is AuthLoaded) {
            if (state.user.accessToken != null) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => SuccessScreen(state.user)),
                (_) => false,
              );
            }
          }
        },
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EmailField(
                      onSaved: _handleEmailSaved,
                      enabled: !isProcessing,
                    ),
                    h16,
                    PasswordField(
                      onSaved: _handlePasswordSaved,
                      enabled: !isProcessing,
                    ),
                    h16,
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: isProcessing ? null : _handleSubmit,
                        child: BlocSelector<AuthBloc, AuthState, String?>(
                          selector: (state) {
                            if (state is AuthLoading) {
                              return state.text;
                            }
                            return null;
                          },
                          builder: (context, progressText) {
                            return Text(progressText ?? 'Login');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AuthBloc>().add(AuthLogoutEvent());
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AuthScreen()),
            (_) => false,
          );
        },
        child: const Icon(Icons.logout_rounded),
      ),
    );
  }
}
