import 'package:flutter/material.dart';

class GaPopupMenuButton extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  final Widget? child;
  final String tooltip;
  final double borderRadius;
  final PopupMenuPosition? position;
  final Color? color;

  const GaPopupMenuButton({
    Key? key,
    required this.menuList,
    this.icon,
    this.child,
    this.tooltip = '',
    this.borderRadius = 10,
    this.position,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: tooltip,
      itemBuilder: (context) {
        return menuList;
      },
      icon: icon,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      position: position ?? PopupMenuPosition.under,
      color: color ?? Theme.of(context).primaryColor,
      padding: EdgeInsets.zero,
      elevation: 0,
      child: child,
    );
  }

  static PopupMenuItem<dynamic> createMenuItem(
      {required BuildContext context,
      required IconData iconData,
      required String title,
      Function()? onTap,
      bool hasDivider = false}) {
    return PopupMenuItem(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 0,
                leading: Icon(
                  iconData,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                horizontalTitleGap: 0,
                title: Text(
                  title,
                  style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            if (hasDivider)
              Opacity(
                opacity: .2,
                child: Divider(
                  height: 0,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
          ],
        ));
  }
}
