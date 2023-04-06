import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color activeColor;
  final Color inactiveColor;
  final bool isActive;
  final bool isHorizontal;

  DashedLinePainter(
      {this.dashWidth = 5,
      this.dashSpace = 3,
      this.activeColor = Colors.blue,
      this.inactiveColor = Colors.grey,
      this.isActive = false,
      this.isHorizontal = true});

  @override
  void paint(Canvas canvas, Size size) {
    double startPoint = 0;
    final paint = Paint()
      ..color = isActive ? activeColor : inactiveColor
      ..strokeWidth = isHorizontal ? size.height : size.width;
    while (startPoint < (isHorizontal ? size.width : size.height)) {
      if (isHorizontal) {
        canvas.drawLine(Offset(startPoint, 0), Offset(startPoint + dashWidth, 0), paint);
      } else {
        canvas.drawLine(Offset(0, startPoint), Offset(0, startPoint + dashWidth), paint);
      }
      startPoint += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
