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
    if (loadingListener != null) {
      return ValueListenableBuilder(
        valueListenable: loadingListener!,
        builder: (context, value, child) => _floatingButton(isLoading: value),
      );
    } else {
      return _floatingButton(isLoading: false);
    }
  }

  FloatingActionButton _floatingButton({required bool isLoading}) {
    return FloatingActionButton(
      mini: true,
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: Colors.white),
            )
          : icon ?? const Icon(Icons.subdirectory_arrow_left),
    );
  }
}
