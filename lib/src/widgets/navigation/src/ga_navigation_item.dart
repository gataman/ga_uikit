// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GaNavigationItem {
  final String label;
  final String route;
  final Widget? icon;
  GaNavigationItem({
    required this.label,
    required this.route,
    this.icon,
  });
}
