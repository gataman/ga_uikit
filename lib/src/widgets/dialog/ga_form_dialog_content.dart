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
      this.cancelButtonColor,
      required this.loadingListener,
      this.confirmButtonRoundType = RadiusType.none,
      this.cancelButtonRoundType = RadiusType.none,
      this.buttonRadius = 10,
      this.confirmIconPosition,
      this.cancelIconPosition,
      this.loadingText,
      this.errorListener,
      this.errorTextStyle,
      this.errorBoxDecoration,
      this.isExpanded = false});

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
  final RadiusType confirmButtonRoundType;
  final IconPosition? confirmIconPosition;

  final Function()? onCancelButtonPressed;
  final String? cancelButtonLabel;
  final Widget? cancelButtonIcon;
  final Color? cancelButtonColor;
  final RadiusType cancelButtonRoundType;

  final IconPosition? cancelIconPosition;
  final double buttonRadius;
  final ValueNotifier<bool>? loadingListener;
  final ValueNotifier<String?>? errorListener;
  final String? loadingText;

  final TextStyle? errorTextStyle;
  final Decoration? errorBoxDecoration;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GaRoundedContainer(
          radius: titleBoxRadius,
          roundType: RadiusType.top,
          height: titleBoxHeight,
          child: _titleRow(context),
        ),
        _errorContainer(context),
        //   Expanded(child: isExpanded ? content : SingleChildScrollView(child: content)),
        isExpanded ? Expanded(child: content) : content,
        _actionButtons(context)
      ],
    );
  }

  Row _actionButtons(BuildContext context) {
    return Row(
      children: [
        if (onCancelButtonPressed != null) _getCancelButton(context),
        if (onConfirmButtonPressed != null && onCancelButtonPressed != null)
          const SizedBox(
            width: 1,
          ),
        if (onConfirmButtonPressed != null) _getConfirmButton(context),
      ],
    );
  }

  Row _titleRow(BuildContext context) {
    return Row(
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
        loadingText: loadingText,
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

  Widget _errorContainer(BuildContext context) {
    if (errorListener != null) {
      return ValueListenableBuilder(
        valueListenable: errorListener!,
        builder: (context, value, child) {
          if (value != null) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: errorBoxDecoration ??
                    BoxDecoration(
                      borderRadius: RadiusType.all.getRadius(5),
                      color: Theme.of(context).colorScheme.error,
                    ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning,
                        color: Theme.of(context).colorScheme.onError,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            errorListener!.value ?? '',
                            style: errorTextStyle ??
                                Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Theme.of(context).colorScheme.onError),
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          errorListener!.value = null;
                        },
                        icon: Icon(
                          Icons.close,
                          size: 16,
                          color: Theme.of(context).colorScheme.onError,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
