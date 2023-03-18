import 'package:flutter/material.dart';

class GaContainerPopupMenuButton extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget child;

  const GaContainerPopupMenuButton({
    Key? key,
    required this.menuList,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return menuList;
      },
      color: Theme.of(context).primaryColor,
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
