import 'package:flutter/material.dart';

enum RoundType { all, top, bottom, left, right }

class GaRoundedContainer extends StatelessWidget {
  const GaRoundedContainer({
    super.key,
    this.child,
    this.radius,
    this.width,
    this.height,
    this.bgColor,
    this.roundType = RoundType.all,
  });

  final Widget? child;
  final double? radius;
  final double? width;
  final double? height;
  final Color? bgColor;
  final RoundType roundType;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).primaryColor,
        borderRadius: _getRadius(),
      ),
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      child: child,
    );
  }

  BorderRadiusGeometry _getRadius() {
    Radius topLeft = Radius.zero;
    Radius bottomLeft = Radius.zero;
    Radius topRight = Radius.zero;
    Radius bottomRight = Radius.zero;

    switch (roundType) {
      case RoundType.all:
        topLeft = Radius.circular(radius ?? 5);
        bottomLeft = Radius.circular(radius ?? 5);
        topRight = Radius.circular(radius ?? 5);
        bottomRight = Radius.circular(radius ?? 5);
        break;
      case RoundType.top:
        topLeft = Radius.circular(radius ?? 5);
        topRight = Radius.circular(radius ?? 5);
        break;
      case RoundType.bottom:
        bottomLeft = Radius.circular(radius ?? 5);
        bottomRight = Radius.circular(radius ?? 5);
        break;
      case RoundType.left:
        topLeft = Radius.circular(radius ?? 5);
        bottomLeft = Radius.circular(radius ?? 5);
        break;
      case RoundType.right:
        topRight = Radius.circular(radius ?? 5);
        bottomRight = Radius.circular(radius ?? 5);
        break;
    }

    return BorderRadius.only(
      topLeft: topLeft,
      bottomLeft: bottomLeft,
      topRight: topRight,
      bottomRight: bottomRight,
    );
  }
}
