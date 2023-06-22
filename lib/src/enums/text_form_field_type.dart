import 'package:flutter/material.dart';

enum TextFormFieldType {
  email(Icons.email),
  password(Icons.lock),
  username(Icons.person);

  final IconData? icon;
  const TextFormFieldType(this.icon);
}
