import 'package:flutter/material.dart';

class GaForm extends StatelessWidget {
  const GaForm({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Form(child: child);
  }
}
