import 'package:flutter/material.dart';

class GaCircularProgress extends StatelessWidget {
  const GaCircularProgress({Key? key, this.boxHeight, this.size, this.color, this.strokeWidth}) : super(key: key);
  final double? boxHeight;
  final double? size;
  final Color? color;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: boxHeight ?? 200,
        child: Center(
          child: SizedBox(
            width: size ?? 50,
            height: size ?? 50,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth ?? 6,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
          ),
        ));
  }
}
