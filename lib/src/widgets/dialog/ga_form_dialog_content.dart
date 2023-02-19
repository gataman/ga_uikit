part of 'ga_form_dialog.dart';

extension CustomColorExtension on BuildContext {
  T? customColor<T>() => Theme.of(this).extension<T>();
}

class GaFormDialogContent extends StatelessWidget {
  const GaFormDialogContent({
    super.key,
    required this.content,
    this.title,
    this.titleStyle,
    this.titleBoxRadius = 10,
    this.titleBoxHeight = 40,
    this.titlePadding = const EdgeInsets.all(8.0),
    this.closeIcon,
    this.onConfirmButtonPressed,
    this.confirmButtonLabel,
    this.confirmButtonIcon,
    this.hasCloseButton = true,
    this.onCancelButtonPressed,
    this.cancelButtonLabel,
    this.cancelButtonIcon,
    this.confirmButtonColor,
    this.cancelButtonColor,
    required this.loadingListener,
    this.confirmButtonRoundType = RoundType.none,
    this.cancelButtonRoundType = RoundType.none,
    this.buttonRadius = 10,
    this.confirmIconPosition,
    this.cancelIconPosition,
  });

  final String? title;
  final Widget content;
  final TextStyle? titleStyle;
  final double titleBoxRadius;
  final double titleBoxHeight;
  final EdgeInsetsGeometry titlePadding;
  final Widget? closeIcon;
  final bool hasCloseButton;

  final Function()? onConfirmButtonPressed;
  final String? confirmButtonLabel;
  final Widget? confirmButtonIcon;
  final Color? confirmButtonColor;
  final RoundType confirmButtonRoundType;
  final IconPosition? confirmIconPosition;

  final Function()? onCancelButtonPressed;
  final String? cancelButtonLabel;
  final Widget? cancelButtonIcon;
  final Color? cancelButtonColor;
  final RoundType cancelButtonRoundType;
  final IconPosition? cancelIconPosition;

  final double buttonRadius;

  final ValueNotifier<bool>? loadingListener;

  @override
  Widget build(BuildContext context) {
    debugPrint('builded');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GaRoundedContainer(
          radius: titleBoxRadius,
          roundType: RoundType.top,
          height: titleBoxHeight,
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: titlePadding,
                child: Text(
                  title ?? '',
                  style: titleStyle ??
                      Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              )),
              if (hasCloseButton)
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: closeIcon ??
                      Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
            ],
          ),
        ),
        Expanded(child: SingleChildScrollView(child: content)),
        Row(
          children: [
            if (onCancelButtonPressed != null) _getCancelButton(context),
            if (onConfirmButtonPressed != null && onCancelButtonPressed != null)
              const SizedBox(
                width: 1,
              ),
            if (onConfirmButtonPressed != null) _getConfirmButton(context),
          ],
        )
      ],
    );
  }

  Widget _getConfirmButton(BuildContext context) {
    return Expanded(
      child: GaLoadingButton(
        loadingListener: loadingListener,
        onPressed: onConfirmButtonPressed,
        text: confirmButtonLabel ?? 'Save',
        radius: buttonRadius,
        roundType: confirmButtonRoundType,
        iconPosition: confirmIconPosition ?? IconPosition.right,
        backgroundColor: confirmButtonColor ?? Colors.green[700],
      ),
    );
  }

  Widget _getCancelButton(BuildContext context) {
    return Expanded(
      child: GaLoadingButton(
        onPressed: onCancelButtonPressed,
        text: cancelButtonLabel ?? 'Cancel',
        radius: buttonRadius,
        roundType: cancelButtonRoundType,
        iconPosition: cancelIconPosition ?? IconPosition.left,
        loadingListener: null,
        backgroundColor: cancelButtonColor ?? Colors.red[700],
      ),
    );
  }
}

/*!SECTION

ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(context, isConfirm) ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular((isConfirm && onCancelButtonPressed != null) ? 0 : 10),
              bottomRight: Radius.circular((!isConfirm && onConfirmButtonPressed != null) ? 0 : 10),
            ),
          ),
        ),
        onPressed: isConfirm ? onConfirmButtonPressed : onCancelButtonPressed,
        icon: isConfirm ? confirmButtonIcon ?? const Icon(Icons.save) : cancelButtonIcon ?? const Icon(Icons.cancel),
        label: isConfirm ? Text(confirmButtonLabel ?? 'Save') : Text(cancelButtonLabel ?? 'Cancel'),
      ),


*/
