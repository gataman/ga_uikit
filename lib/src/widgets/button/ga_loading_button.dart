import 'package:flutter/material.dart';

import '../../enums/icon_position.dart';
import '../../enums/round_type.dart';

class GaLoadingButton extends StatelessWidget {
  const GaLoadingButton({
    Key? key,
    required this.text,
    required this.loadingListener,
    this.onPressed,
    this.backgroundColor,
    this.buttonStyle,
    this.iconData = Icons.save,
    this.iconSize = 20.0,
    this.iconColor,
    this.loadingText = 'Please wait',
    this.radius = 5,
    this.roundType = RoundType.all,
    this.textColor,
    this.textStyle,
    this.iconPosition = IconPosition.left,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final IconData iconData;
  final ValueNotifier<bool>? loadingListener;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final double radius;
  final RoundType roundType;
  final String? loadingText;
  final double iconSize;
  final Color? iconColor;
  final TextStyle? textStyle;
  final IconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    return loadingListener != null
        ? ValueListenableBuilder(
            valueListenable: loadingListener!,
            builder: (context, isLoading, child) {
              return _getButtonElement(context, isLoading);
            },
          )
        : _getButtonElement(context, false);
  }

  ElevatedButton _getButtonElement(BuildContext context, bool isLoading) {
    return ElevatedButton(
      style: buttonStyle ??
          ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: roundType.getRadius(radius))),
      onPressed: () {
        if (!isLoading && onPressed != null) {
          onPressed!();
        }
      },
      child: Row(
        children: [
          _getIcon(
            context: context,
            position: IconPosition.left,
            isLoading: isLoading,
          ),
          Expanded(
            child: Center(
              child: Text(
                isLoading ? loadingText ?? text : text,
                style: textStyle ??
                    TextStyle(
                      color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          _getIcon(
            context: context,
            position: IconPosition.right,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }

  Widget _getIcon({required BuildContext context, required IconPosition position, required bool isLoading}) {
    if (position == iconPosition) {
      return isLoading
          ? SizedBox(
              width: iconSize,
              height: iconSize,
              child: CircularProgressIndicator(
                color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : Icon(
              iconData,
              size: iconSize,
              color: textColor ?? Theme.of(context).colorScheme.onPrimary,
            );
    }
    return const SizedBox.shrink();
  }
}


/*!SECTION


 if (isLoading) {
                    return SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                        ));
                  } else {
                    return Icon(
                      iconData,
                      size: 20,
                      color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                    );
                  }
*/

/*!SECTION


return Row(
            children: [
              isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  : Icon(
                      iconData,
                      size: 20,
                      color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                    ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: textColor ?? Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );



*/