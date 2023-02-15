import 'package:flutter/material.dart';

import 'ga_popup_menu_button.dart';

typedef MenuCallBack = void Function(MenuType menuType);

enum MenuType { add, edit, delete }

class CrudPopupMenu extends StatelessWidget {
  const CrudPopupMenu({super.key, required this.menuCallBack, this.iconData});

  final MenuCallBack menuCallBack;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return GaPopupMenuButton(
      menuList: [
        GaPopupMenuButton.createMenuItem(
          context: context,
          iconData: Icons.add,
          title: 'Ekle',
          hasDivider: true,
          onTap: () {
            menuCallBack(MenuType.add);
          },
        ),
        GaPopupMenuButton.createMenuItem(
          context: context,
          iconData: Icons.edit,
          title: 'Düzenle',
          hasDivider: true,
          onTap: () {
            menuCallBack(MenuType.edit);
          },
        ),
        GaPopupMenuButton.createMenuItem(
          context: context,
          iconData: Icons.delete,
          title: 'Sil',
          onTap: () {
            menuCallBack(MenuType.delete);
          },
        ),
      ],
      icon: Icon(iconData ?? Icons.more_vert),
    );
  }
}
