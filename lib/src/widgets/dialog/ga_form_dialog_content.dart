part of 'ga_form_dialog.dart';

extension CustomColorExtension on BuildContext {
  T? customColor<T>() => Theme.of(this).extension<T>();
}

class GaFormDialogContent extends StatelessWidget {
  const GaFormDialogContent(
      {super.key,
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
      this.cancelButtonColor});

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

  final Function()? onCancelButtonPressed;
  final String? cancelButtonLabel;
  final Widget? cancelButtonIcon;
  final Color? cancelButtonColor;

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
            if (onCancelButtonPressed != null) _getActionButton(isConfirm: false, context: context),
            if (onConfirmButtonPressed != null) _getActionButton(isConfirm: true, context: context),
          ],
        )
      ],
    );
  }

  Widget _getActionButton({required bool isConfirm, required BuildContext context}) {
    return Expanded(
      child: ElevatedButton.icon(
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
    );
  }

  Color? _getBackgroundColor(BuildContext context, bool isConfirm) {
    final customColor = context.customColor<CustomColors>();

    return isConfirm ? confirmButtonColor ?? customColor?.success : cancelButtonColor ?? customColor?.danger;
  }
}
