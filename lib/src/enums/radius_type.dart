
import 'package:flutter/material.dart';

enum RadiusType {
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

extension RoundTypeRadius on RadiusType {
  BorderRadiusGeometry getRadius(radius) {
    Radius topLeft = Radius.zero;
    Radius bottomLeft = Radius.zero;
    Radius topRight = Radius.zero;
    Radius bottomRight = Radius.zero;

    switch (this) {
      case RadiusType.all:
        topLeft = Radius.circular(radius ?? 5);
        bottomLeft = Radius.circular(radius ?? 5);
        topRight = Radius.circular(radius ?? 5);
        bottomRight = Radius.circular(radius ?? 5);
        break;
      case RadiusType.top:
        topLeft = Radius.circular(radius ?? 5);
        topRight = Radius.circular(radius ?? 5);
        break;
      case RadiusType.bottom:
        bottomLeft = Radius.circular(radius ?? 5);
        bottomRight = Radius.circular(radius ?? 5);
        break;
      case RadiusType.left:
        topLeft = Radius.circular(radius ?? 5);
        bottomLeft = Radius.circular(radius ?? 5);
        break;
      case RadiusType.right:
        topRight = Radius.circular(radius ?? 5);
        bottomRight = Radius.circular(radius ?? 5);
        break;

      case RadiusType.topLeft:
        topLeft = Radius.circular(radius ?? 5);
        break;
      case RadiusType.bottomLeft:
        bottomLeft = Radius.circular(radius ?? 5);
        break;
      case RadiusType.topRight:
        topRight = Radius.circular(radius ?? 5);
        break;
      case RadiusType.bottomRight:
        bottomRight = Radius.circular(radius ?? 5);
        break;
      case RadiusType.topLeftAndBottomRight:
        topLeft = Radius.circular(radius ?? 5);
        bottomRight = Radius.circular(radius ?? 5);
        break;
      case RadiusType.topRightAndBottomLeft:
        topRight = Radius.circular(radius ?? 5);
        bottomLeft = Radius.circular(radius ?? 5);
        break;
      case RadiusType.none:
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
