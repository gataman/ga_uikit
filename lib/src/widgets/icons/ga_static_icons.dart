import 'package:flutter/material.dart';

abstract class GaStaticIcons extends StatelessWidget {
  const GaStaticIcons({super.key});
}

class AddSuffixIcon extends GaStaticIcons {
  const AddSuffixIcon({super.key, required this.onPressed, this.icon});
  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: onPressed,
      child: icon ?? const Icon(Icons.subdirectory_arrow_left),
    );
  }
}
