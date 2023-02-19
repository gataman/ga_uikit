import 'package:flutter/material.dart';

class GaTextFormField extends StatelessWidget {
  const GaTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.autoFocus = false,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.controller,
  });

  final String? label;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool autoFocus;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool obscureText;
  final String obscuringCharacter;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(label: Text(label ?? ''), hintText: hintText),
      keyboardType: TextInputType.name,
      textInputAction: textInputAction ?? TextInputAction.go,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      showCursor: true,
      autofocus: autoFocus,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
    );
  }
}
