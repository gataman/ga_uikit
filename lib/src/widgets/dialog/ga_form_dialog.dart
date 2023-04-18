import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:ga_uikit/src/constants/dialog_constants.dart';

import '../../enums/icon_position.dart';
import '../../enums/radius_type.dart';
import '../button/ga_loading_button.dart';
import '../container/ga_rounded_container.dart';

part 'ga_form_dialog_content.dart';

class GaFormDialog extends StatelessWidget {
  const GaFormDialog(
      {super.key,
      required this.buildContent,
      @Deprecated('Use largePadding, mediumPadding and smallPadding. '
          'You can use it to set the dialog size')
          double? widthRatio = .5,
      @Deprecated('Use largePadding, mediumPadding and smallPadding. '
          'You can use it to set the dialog size')
          double? heightRatio = .8,
      this.largePadding,
      this.mediumPadding,
      this.smallPadding,
      this.dialogRadius});

  final EdgeInsets? largePadding;

  final EdgeInsets? mediumPadding;

  final EdgeInsets? smallPadding;

  final BorderRadiusGeometry? dialogRadius;

  final Widget Function(BuildContext context) buildContent;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: AdaptiveLayout(
              body: SlotLayout(config: <Breakpoint, SlotLayoutConfig>{
                const WidthPlatformBreakpoint(begin: 1000): SlotLayout.from(
                  key: const Key('dialog_large'),
                  builder: (context) {
                    return _getDialog(
                      context: context,
                      insetPadding: largePadding ??
                          const EdgeInsets.symmetric(
                            horizontal: DialogConstants.largeWidthPadding,
                            vertical: DialogConstants.heightPadding,
                          ),
                    );
                  },
                ),
                const WidthPlatformBreakpoint(begin: 450, end: 999): SlotLayout.from(
                  key: const Key('dialog_medium'),
                  builder: (context) {
                    return _getDialog(
                      context: context,
                      insetPadding: mediumPadding ??
                          const EdgeInsets.symmetric(
                            horizontal: DialogConstants.mediumWidthPadding,
                            vertical: DialogConstants.heightPadding,
                          ),
                    );
                  },
                ),
                const WidthPlatformBreakpoint(begin: 0, end: 449): SlotLayout.from(
                  key: const Key('dialog_small'),
                  builder: (context) {
                    debugPrint('small and up');
                    return _getDialog(
                      context: context,
                      insetPadding: mediumPadding ??
                          const EdgeInsets.symmetric(
                            horizontal: DialogConstants.smallWidthPadding,
                            vertical: DialogConstants.heightPadding,
                          ),
                    );
                  },
                ),
              }),
            ),
          );
        },
      ),
    );
  }

  Dialog _getDialog({required BuildContext context, EdgeInsets? insetPadding}) {
    return Dialog(
        insetPadding: insetPadding,
        shape: RoundedRectangleBorder(borderRadius: dialogRadius ?? RadiusType.all.getRadius(10.0)),
        child: buildContent(context));
  }
}


/*!SECTION
LayoutBuilder(
                builder: (context, boxConstraints) {
                  final width = _getDialogWidth(boxConstraints);
                  final height = _getDialogHeight(boxConstraints);
                  return SizedBox(
                    width: width,
                    height: height,
                    child: buildContent(context),
                  );
                },
              ),

*/