import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  const InfoField(this.text, {super.key});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '-',
      style: const TextStyle(fontSize: 15),
    );
  }
}
