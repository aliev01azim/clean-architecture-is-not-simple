import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/shortcasts.dart';
import '../bloc/auth_bloc.dart';
import '../../../../../core/extensions/auth_ext.dart';
import '../../domain/entities/auth_info/auth_info.dart';
import 'fields.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _firstname = '';
  String _lastname = '';
  String _password = '';
  String _email = '';
  String _phone = '';

  void _handleSubmit() {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    form.save();

    context.read<AuthBloc>().add(AuthEvent.register(
        username: _username,
        password: _password,
        email: _email,
        phone: _phone,
        firstname: _firstname,
        lastname: _lastname));
  }

  void _handleUsernameSaved(String? v) => _username = v ?? '';
  void _handleFirstNameSaved(String? v) => _firstname = v ?? '';
  void _handleLastNameSaved(String? v) => _lastname = v ?? '';
  void _handlePasswordSaved(String? v) => _password = v ?? '';
  void _handleEmailSaved(String? v) => _email = v ?? '';
  void _handlePhoneSaved(String? v) => _phone = v ?? '';
  @override
  Widget build(BuildContext context) {
    final isProcessing = context.watchAuthProcessing();

    return Center(
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
                PasswordField(
                  onSaved: _handlePasswordSaved,
                  enabled: !isProcessing,
                ),
                h16,
                EmailField(
                  onSaved: _handleEmailSaved,
                  enabled: !isProcessing,
                ),
                h16,
                PhoneField(
                  onSaved: _handlePhoneSaved,
                  enabled: !isProcessing,
                ),
                h16,
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isProcessing ? null : _handleSubmit,
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
