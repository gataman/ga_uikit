import 'package:flutter/material.dart';
import 'package:ga_uikit/ga_uikit.dart';

enum DialogType { success, warning, error }

class GaStaticDialogs {
  static void showSnackBar(
      {required BuildContext context, required String message, required DialogType type, Duration? duration}) {
    final snackBar = SnackBar(
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: type == DialogType.success
          ? Colors.green
          : type == DialogType.warning
              ? Colors.amber
              : Colors.redAccent,
      content: Row(
        children: [
          Icon(
            type == DialogType.success
                ? Icons.check_circle
                : type == DialogType.warning
                    ? Icons.report_problem
                    : Icons.dangerous,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Spacer(),
          Text(
            message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showConfirmDialog(
      {required BuildContext context,
      required String message,
      required VoidCallback onConfirm,
      ConfirmType confirmType = ConfirmType.delete,
      String? title,
      String? buttonLabel}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
              //contentPadding: const EdgeInsets.all(defaultPadding),
              actionsPadding: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              titlePadding: EdgeInsets.zero,
              title: Center(
                  child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              )),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'Uyarı',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                GaLoadingButton(
                  text: buttonLabel ?? 'Sil',
                  loadingListener: null,
                  onPressed: () {
                    onConfirm();
                    Navigator.of(ctx).pop();
                  },
                  backgroundColor: confirmType == ConfirmType.delete
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary,
                  iconData: confirmType == ConfirmType.delete ? Icons.delete : Icons.check,
                )
                /*  AppDeleteButton(onConfirm: () {
                  onConfirm();
                  Navigator.of(ctx).pop();
                }) */
              ]);
        });
  }

  static void showAddDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
    required Widget content,
  }) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
              //contentPadding: const EdgeInsets.all(defaultPadding),
              actionsPadding: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              titlePadding: EdgeInsets.zero,
              title: Center(
                  child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              )),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Uyarı',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    content,
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                GaLoadingButton(
                  text: 'Sil',
                  loadingListener: null,
                  onPressed: () {
                    onConfirm();
                    Navigator.of(ctx).pop();
                  },
                  backgroundColor: Theme.of(context).colorScheme.error,
                  iconData: Icons.delete,
                )
                /*  AppDeleteButton(onConfirm: () {
                  onConfirm();
                  Navigator.of(ctx).pop();
                }) */
              ]);
        });
  }
}

/*
Expanded(
                      child: Text(LocaleKeys.actions_warning.locale(),
                          textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge)),
                 
*/
