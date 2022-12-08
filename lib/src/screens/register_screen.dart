import 'package:auth/src/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../helpers/helper.dart';
import '../helpers/shortcasts.dart';
import '../widgets/fields.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _firstname = '';
  String _lastname = '';
  String _password = '';
  String _email = '';
  String _phone = '';
  bool isWithLogin = false;
  final GlobalKey key = GlobalKey();
  void _handleSubmit() {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    form.save();

    context.read<AuthBloc>().add(AuthRegisterEvent(
          username: _username,
          password: _password,
          email: _email,
          phone: _phone,
          firstName: _firstname,
          lastName: _lastname,
        ));
  }

  void _handleUsernameSaved(String? v) => _username = v ?? '';
  void _handleFirstNameSaved(String? v) => _firstname = v ?? '';
  void _handleLastNameSaved(String? v) => _lastname = v ?? '';
  void _handlePasswordSaved(String? v) => _password = v ?? '';
  void _handleEmailSaved(String? v) => _email = v ?? '';
  void _handlePhoneSaved(String? v) => _phone = v ?? '';
  @override
  Widget build(BuildContext context) {
    final isProcessing = context.watch<AuthBloc>().state is AuthLoading;

    return WillPopScope(
      onWillPop: () async {
        context.read<AuthBloc>().add(AuthWithLoginEvent(withLogin: false));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
          leading: BackButton(
            onPressed: () {
              context
                  .read<AuthBloc>()
                  .add(AuthWithLoginEvent(withLogin: false));
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              key: key,
              icon: const Icon(Icons.info),
              onPressed: () => showInfo(context, key,
                  'Если вы отметите галочку то \n будет и логин и регистрация \n и вы успешно полностью \n проёдете авторизацию.\n И вместо обычной загрузки \n показал поэтапное завершение запросов'),
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
              if (state.user.accessToken == null) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (_) => false,
                );
              } else {
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
                      UsernameField(
                        onSaved: _handleUsernameSaved,
                        enabled: !isProcessing,
                      ),
                      h16,
                      FirstNameField(
                        onSaved: _handleFirstNameSaved,
                        enabled: !isProcessing,
                      ),
                      h16,
                      LastNameField(
                        onSaved: _handleLastNameSaved,
                        enabled: !isProcessing,
                      ),
                      h16,
                      PhoneField(
                        onSaved: _handlePhoneSaved,
                        enabled: !isProcessing,
                      ),
                      h16,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          StatefulBuilder(builder: (context, innerSetState) {
                            return Checkbox(
                              value: isWithLogin,
                              onChanged: (value) {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthWithLoginEvent(withLogin: value!));
                                innerSetState(() => isWithLogin = value);
                              },
                            );
                          }),
                          w10,
                          const Text('Зарегестрироваться с логином'),
                        ],
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
                              return Text(progressText ?? 'Register');
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
      ),
    );
  }
}
