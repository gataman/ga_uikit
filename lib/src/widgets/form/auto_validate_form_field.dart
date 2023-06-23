// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../enums/text_form_field_type.dart';
import '../../helpers/text_form_field_validation.dart';

typedef OnSaved = void Function(String? value);

class AutoValidateFormField extends StatefulWidget {
  final String label;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? helperText;

  final TextFormFieldType? fieldType;
  final bool isRequired;

  final double borderRadius;
  final bool outlineBorder;

  final int minLength;

  final TextEditingController? controller;
  final OnSaved? onSaved;

  const AutoValidateFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.helperText,
    this.fieldType,
    this.isRequired = false,
    this.borderRadius = 4.0,
    this.outlineBorder = false,
    this.minLength = 0,
    this.controller,
    this.onSaved,
  });

  @override
  State<AutoValidateFormField> createState() => _AutoValidateFormFieldState();
}

class _AutoValidateFormFieldState extends State<AutoValidateFormField> {
  late bool _showObscureText;
  late bool _onCompleted;
  String? _errorText;

  @override
  void initState() {
    _showObscureText = false;
    _onCompleted = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: _getValidator,
      keyboardType: _getKeyboardType,
      obscureText: widget.fieldType == TextFormFieldType.password && !_showObscureText,
      onChanged: _onChanged,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _getSuffixIcon,
        helperText: widget.helperText,
        errorText: _errorText,
        border: widget.outlineBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  widget.borderRadius,
                ),
              )
            : null,
      ),
    );
  }

  TextInputType? get _getKeyboardType =>
      widget.fieldType == TextFormFieldType.email ? TextInputType.emailAddress : TextInputType.text;

  String? Function(String? value)? get _getValidator =>
      widget.isRequired ? TextFormFieldValidation.validateRequired : _getValidatorByType;

  String? Function(String?) get _getValidatorByType {
    switch (widget.fieldType) {
      case TextFormFieldType.email:
        return TextFormFieldValidation.validateEmail;
      case TextFormFieldType.username:
        return TextFormFieldValidation.validateUserName;
      default:
        return (value) => null;
    }
  }

  Widget? get _getSuffixIcon {
    if (widget.fieldType == TextFormFieldType.password) {
      return IconButton(
        onPressed: () {
          setState(() {
            _showObscureText = !_showObscureText;
          });
        },
        icon: Icon(
          color: Theme.of(context).colorScheme.primary,
          _onCompleted
              ? Icons.check
              : _showObscureText
                  ? Icons.visibility
                  : Icons.visibility_off,
        ),
      );
    } else {
      if (_errorText != null) {
        return Icon(Icons.error, color: Theme.of(context).colorScheme.error);
      } else if (_onCompleted) {
        return _getCheckIcon;
      } else {
        return null;
      }
    }
  }

  void _onChanged(String value) {
    if (value.length < widget.minLength) {
      setState(() {
        _errorText = widget.minLength <= 1 ? 'Bu alan boş olamaz!' : 'En az ${widget.minLength} karakter girmelisiniz!';
        _onCompleted = false;
      });
    } else if (widget.fieldType == TextFormFieldType.email) {
      if (TextFormFieldValidation.validateEmail(value) != null) {
        setState(() {
          _errorText = TextFormFieldValidation.validateEmail(value);
          _onCompleted = false;
        });
      } else {
        setState(() {
          _onCompleted = true;
          _errorText = null;
        });
      }
    } else if (widget.fieldType == TextFormFieldType.username) {
      if (TextFormFieldValidation.validateUserName(value) != null) {
        setState(() {
          _errorText = TextFormFieldValidation.validateUserName(value);
          _onCompleted = false;
        });
      } else {
        setState(() {
          _onCompleted = true;
          _errorText = null;
        });
      }
    } else {
      setState(() {
        _onCompleted = true;
        _errorText = null;
      });
    }
  }

  Widget? get _getCheckIcon => Icon(Icons.check, color: Theme.of(context).colorScheme.primary);
}
