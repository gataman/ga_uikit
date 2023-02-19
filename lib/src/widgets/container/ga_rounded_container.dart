import 'package:flutter/material.dart';

import '../../enums/radius_type.dart';

class GaRoundedContainer extends StatelessWidget {
  const GaRoundedContainer({
    super.key,
    this.child,
    this.radius,
    this.width,
    this.height,
    this.bgColor,
    this.roundType = RadiusType.all,
  });

  final Widget? child;
  final double? radius;
  final double? width;
  final double? height;
  final Color? bgColor;
  final RadiusType roundType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).primaryColor,
        borderRadius: roundType.getRadius(radius),
      ),
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      child: child,
    );
  }
}
