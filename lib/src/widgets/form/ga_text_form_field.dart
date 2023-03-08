import 'package:flutter/material.dart';
import 'package:ga_uikit/src/widgets/icons/ga_static_icons.dart';

class GaTextFormField extends StatelessWidget {
  const GaTextFormField(
      {super.key,
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
      this.suffixIcon,
      this.focusNode});

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
  final GaStaticIcons? suffixIcon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label ?? ''),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType ?? TextInputType.name,
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
