import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
    required this.onSaved,
    required this.enabled,
  });

  final ValueSetter<String?> onSaved;
  final bool enabled;

  @override
  Widget build(BuildContext context) => TextFormField(
        enabled: enabled,
        decoration: const InputDecoration(
          labelText: 'Username',
          border: OutlineInputBorder(),
        ),
        onSaved: onSaved,
        validator: _requiredField,
      );
}

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    required this.onSaved,
    required this.enabled,
  });

  final ValueSetter<String?> onSaved;
  final bool enabled;

  @override
  Widget build(BuildContext context) => TextFormField(
        enabled: enabled,
        decoration: const InputDecoration(
          labelText: 'Phone',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.phone,
        onSaved: onSaved,
        validator: _requiredPhoneField,
      );
}

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    super.key,
    required this.onSaved,
    required this.enabled,
  });

  final ValueSetter<String?> onSaved;
  final bool enabled;

  @override
  Widget build(BuildContext context) => TextFormField(
        enabled: enabled,
        decoration: const InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
        onSaved: onSaved,
      );
}

class LastNameField extends StatelessWidget {
  const LastNameField({
    super.key,
    required this.onSaved,
    required this.enabled,
  });

  final ValueSetter<String?> onSaved;
  final bool enabled;

  @override
  Widget build(BuildContext context) => TextFormField(
        enabled: enabled,
        decoration: const InputDecoration(
          labelText: 'Surname',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
        onSaved: onSaved,
      );
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.onSaved,
    required this.enabled,
  });

  final ValueSetter<String?> onSaved;
  final bool enabled;

  @override
  Widget build(BuildContext context) => TextFormField(
        enabled: enabled,
        decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        onSaved: onSaved,
        validator: _requiredEmailField,
      );
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.onSaved,
    required this.enabled,
  });

  final ValueSetter<String?> onSaved;
  final bool enabled;

  @override
  Widget build(BuildContext context) => TextFormField(
        enabled: enabled,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
        onSaved: onSaved,
        validator: _requiredField,
      );
}

String? _requiredField(String? value) =>
    value?.isEmpty ?? true ? '???????????????????????? ????????' : null;

String? _requiredEmailField(String? value) {
  return value?.isEmpty ?? true
      ? '???????????????????????? ????????'
      : !value.isValidEmail()
          ? '???????????????????????? ???????????? ??????????'
          : null;
}

String? _requiredPhoneField(String? value) {
  return value?.isEmpty ?? true
      ? '???????????????????????? ????????'
      : !value.isMobileNumberValid()
          ? '?????????? ???????????? ???????????????? ???? ????????'
          : null;
}

extension on String? {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this!);
  }

  bool isMobileNumberValid() {
    String regexPattern = r"[\d]";
    var regExp = RegExp(regexPattern);

    if (this!.isEmpty) {
      return false;
    } else if (regExp.hasMatch(this!)) {
      return true;
    }
    return false;
  }
}
