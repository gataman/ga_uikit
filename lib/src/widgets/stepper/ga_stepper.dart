import 'package:flutter/material.dart';

import '../../painters/dashed_line_painter.dart';

class GaStepper extends StatelessWidget {
  /// Creates a stepper widget.
  ///
  /// The [children] parameter is required and specifies the list of widgets to be displayed as steps.
  ///
  /// The [currentStep] parameter is optional and specifies the current step. The default value is 0.
  ///
  /// The [backgroundColor] parameter is optional and specifies the background color of the stepper widget.
  ///
  /// The [divider] parameter is optional and specifies the widget to be used as a divider .
  ///
  /// The [infoList] parameter is optional and specifies a information to be displayed below each step.
  ///
  /// The [expanded] parameter is optional. You can set false if you want the widgets shown in the steps not to expand or scroll.
  ///
  /// The [stepWidgets] parameter is optional. You can set widgets to be displayed in the steps.There should be as many widgets as the total number of children
  const GaStepper(
      {super.key,
      required this.children,
      this.currentStep = 0,
      this.expanded = true,
      this.backgroundColor,
      this.divider,
      this.infoList,
      this.stepWidgets})
      : assert(stepWidgets == null || children.length == stepWidgets.length,
            'stepWidgets should have the same length as children');

  final List<Widget> children;
  final int currentStep;
  final bool expanded;
  final Color? backgroundColor;
  final Widget? divider;
  final List<String?>? infoList;
  final List<Widget>? stepWidgets;

  @override
  Widget build(BuildContext context) {
    final childStep =
        currentStep < children.length ? SingleChildScrollView(child: children[currentStep]) : const SizedBox.shrink();
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(color: backgroundColor, child: Row(children: _getStepperButtons())),
          _getDivider(),
          expanded ? Expanded(child: childStep) : childStep
        ],
      ),
    );
  }

  List<Widget> _getStepperButtons() {
    List<Widget> widgetList = [];
    for (var i = 0; i < children.length; i++) {
      if (stepWidgets != null && stepWidgets!.length >= children.length) {
        widgetList.add(stepWidgets![i]);
      } else {
        widgetList.add(
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _StepperButton(label: '${i + 1}', isActive: i <= currentStep),
              if (infoList != null && infoList!.isNotEmpty) Text(infoList![i] != null ? infoList![i] ?? '' : ''),
            ],
          ),
        );
      }

      if (i < children.length - 1) {
        widgetList.add(_StepperDivider(isActive: i <= currentStep - 1));
      }
    }
    return widgetList;
  }

  Widget _getDivider() {
    if (divider != null) {
      return divider!;
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({
    required this.label,
    required this.isActive,
  });

  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 32,
      height: 32,
      child: ElevatedButton(
        onPressed: isActive ? () {} : null,
        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}

class _StepperDivider extends StatelessWidget {
  final bool isActive;

  const _StepperDivider({required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomPaint(
        size: const Size(double.infinity, 1),
        painter: DashedLinePainter(dashWidth: 4, isActive: isActive, inactiveColor: Colors.grey.withOpacity(.5)),
      ),
    );
  }
}
