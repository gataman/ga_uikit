import 'package:flutter/material.dart';

class GaEmptyAlertText extends StatelessWidget {
  const GaEmptyAlertText({
    super.key,
    required this.message,
    this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.hasIcon = true,
    this.icon,
    this.textAlign,
    this.textStyle,
  });

  final String message;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final bool hasIcon;
  final Widget? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasIcon)
              icon ??
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).colorScheme.error,
                  ),
            if (hasIcon)
              const SizedBox(
                height: 8,
              ),
            InkWell(
                onTap: onPressed,
                child: Text(
                  message,
                  textAlign: textAlign ?? TextAlign.center,
                  style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
                )),
          ],
        ),
      ),
    );
  }
}
