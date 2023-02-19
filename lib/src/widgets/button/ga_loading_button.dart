import 'package:flutter/material.dart';

import '../../enums/round_type.dart';

class GaLoadingButton extends StatelessWidget {
  const GaLoadingButton({
    Key? key,
    required this.text,
    required this.loadingListener,
    required this.onPressed,
    this.backColor,
    this.buttonStyle,
    this.iconData = Icons.save,
    this.iconSize = 20.0,
    this.iconColor,
    this.loadingText = 'Please wait',
    this.radius = 5,
    this.roundType = RoundType.all,
    this.textColor,
    this.textStyle,
  }) : super(key: key);

  final Color? backColor;
  final Color? textColor;
  final String text;
  final IconData iconData;
  final ValueNotifier<bool> loadingListener;
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  final double radius;
  final RoundType roundType;
  final String loadingText;
  final double iconSize;
  final Color? iconColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loadingListener,
      builder: (context, isLoading, child) {
        return ElevatedButton(
          style: buttonStyle ??
              ElevatedButton.styleFrom(
                  backgroundColor: backColor ?? Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: roundType.getRadius(radius))),
          onPressed: () {
            if (!isLoading) {
              onPressed();
            }
          },
          child: Row(
            children: [
              isLoading
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
                    ),
              Expanded(
                child: Center(
                  child: Text(
                    isLoading ? loadingText : text,
                    style: textStyle ??
                        TextStyle(
                          color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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