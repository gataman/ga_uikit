import 'package:flutter/material.dart';

enum RoundType {
  all,
  none,
  top,
  bottom,
  left,
  right,
  topLeft,
  bottomLeft,
  topRight,
  bottomRight,
  topLeftAndBottomRight,
  topRightAndBottomLeft
}

extension RoundTypeRadius on RoundType {
  BorderRadiusGeometry getRadius(radius) {
    Radius topLeft = Radius.zero;
    Radius bottomLeft = Radius.zero;
    Radius topRight = Radius.zero;
    Radius bottomRight = Radius.zero;

    switch (this) {
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

      case RoundType.topLeft:
        topLeft = Radius.circular(radius ?? 5);
        break;
      case RoundType.bottomLeft:
        bottomLeft = Radius.circular(radius ?? 5);
        break;
      case RoundType.topRight:
        topRight = Radius.circular(radius ?? 5);
        break;
      case RoundType.bottomRight:
        bottomRight = Radius.circular(radius ?? 5);
        break;
      case RoundType.topLeftAndBottomRight:
        topLeft = Radius.circular(radius ?? 5);
        bottomRight = Radius.circular(radius ?? 5);
        break;
      case RoundType.topRightAndBottomLeft:
        topRight = Radius.circular(radius ?? 5);
        bottomLeft = Radius.circular(radius ?? 5);
        break;
      case RoundType.none:
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
