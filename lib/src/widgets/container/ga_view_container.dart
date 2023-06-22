import 'package:flutter/material.dart';

class GaViewContainer extends StatelessWidget {
  const GaViewContainer(
      {Key? key,
      this.minHeight = 0,
      required this.child,
      this.padding = const EdgeInsets.all(8.0),
      this.isScrollable = false,
      this.borderColor,
      this.borderWidth,
      this.cardMargin,
      this.backgroundColor,
      this.elevation})
      : super(key: key);

  final Widget child;

  final EdgeInsetsGeometry padding;
  final double minHeight;
  final bool isScrollable;
  final Color? borderColor;
  final double? borderWidth;
  final double? cardMargin;
  final Color? backgroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 0,
      color: backgroundColor,
      margin: EdgeInsets.all(cardMargin ?? 0),
      /* shape: BeveledRectangleBorder(
        side: BorderSide(
          color: borderColor ?? Theme.of(context).dividerColor,
          width: borderWidth ?? .5,
        ),
      ), */
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: minHeight,
          minWidth: double.infinity,
        ),
        child: Padding(
            padding: padding,
            child: isScrollable
                ? SingleChildScrollView(
                    child: child,
                  )
                : child),
      ),
    );
  }
}
