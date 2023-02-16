import 'package:flutter/material.dart';

/// An arbitrary widget that lives in a popup menu
class HorizontalPopupMenuItem<T> extends PopupMenuEntry<T> {
  const HorizontalPopupMenuItem({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  final double height;

  @override
  bool represents(T? value) => false;

  @override
  State<StatefulWidget> createState() => _PopupMenuWidgetState();
}

class _PopupMenuWidgetState extends State<HorizontalPopupMenuItem> {
  @override
  Widget build(BuildContext context) => widget.child;
}
