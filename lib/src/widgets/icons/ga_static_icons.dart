import 'package:flutter/material.dart';

abstract class GaStaticIcons extends StatelessWidget {
  const GaStaticIcons({super.key});
}

class AddSuffixIcon extends GaStaticIcons {
  const AddSuffixIcon({
    super.key,
    required this.onPressed,
    this.icon,
    this.loadingListener,
  });
  final VoidCallback? onPressed;
  final Widget? icon;
  final ValueNotifier<bool>? loadingListener;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: onPressed,
      child: loadingListener != null && loadingListener!.value
          ? const CircularProgressIndicator()
          : icon ?? const Icon(Icons.subdirectory_arrow_left),
    );
  }
}
