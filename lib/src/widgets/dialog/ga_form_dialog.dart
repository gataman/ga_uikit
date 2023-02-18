import 'package:flutter/material.dart';

import '../../theme/custom_colors.dart';
import '../container/ga_rounded_container.dart';

part 'ga_form_dialog_content.dart';

class GaFormDialog extends StatelessWidget {
  const GaFormDialog({
    super.key,
    required this.dialogContent,
    this.widthRatio = .5,
    this.heightRatio = .8,
  });

  final GaFormDialogContent dialogContent;

  // This only works in desktop size
  final double widthRatio;
  final double heightRatio;

  @override
  Widget build(BuildContext context) {
    return Dialog(child: LayoutBuilder(
      builder: (context, boxConstraints) {
        final width = _getDialogWidth(boxConstraints);
        final height = _getDialogHeight(boxConstraints);
        return SizedBox(
          width: width,
          height: height,
          child: dialogContent,
        );
      },
    ));
  }

  double _getDialogWidth(BoxConstraints boxConstraints) =>
      boxConstraints.maxWidth > 1000 ? boxConstraints.maxWidth * widthRatio : boxConstraints.maxWidth;

  double _getDialogHeight(BoxConstraints boxConstraints) => boxConstraints.maxHeight * heightRatio;
}
