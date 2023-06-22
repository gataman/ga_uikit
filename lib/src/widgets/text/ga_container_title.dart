import 'package:flutter/material.dart';

enum TitleDividerPos {
  up,
  down,
  all,
  none,
}

enum TitleDividerType {
  thin(.3),
  medium(.5),
  strong(1);

  const TitleDividerType(this.size);
  final double size;
}

class GaContainerTitle extends StatelessWidget {
  const GaContainerTitle({
    super.key,
    required this.title,
    this.icon = const Icon(
      Icons.add,
      size: 24,
    ),
    this.hasButton = false,
    this.buttonLabel,
    this.titleTextStyle,
    this.dividerPos = TitleDividerPos.down,
    this.dividerType = TitleDividerType.thin,
    this.onButtonPressed,
  });

  final String title;
  final Widget icon;

  final bool hasButton;
  final String? buttonLabel;
  final TextStyle? titleTextStyle;
  final TitleDividerPos dividerPos;
  final TitleDividerType dividerType;
  final Function()? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _getDivider(TitleDividerPos.up),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: titleTextStyle ?? Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (hasButton)
                ElevatedButton.icon(
                  onPressed: onButtonPressed,
                  icon: icon,
                  label: Text(buttonLabel ?? 'Yeni Ekle'),
                )
            ],
          ),
        ),
        _getDivider(TitleDividerPos.down)
      ],
    );
  }

  Widget _getDivider(TitleDividerPos pos) {
    if (dividerPos == pos || dividerPos == TitleDividerPos.all) {
      return Divider(
        thickness: dividerType.size,
      );
    } else {
      return const SizedBox(
        height: 8,
      );
    }
  }
}
