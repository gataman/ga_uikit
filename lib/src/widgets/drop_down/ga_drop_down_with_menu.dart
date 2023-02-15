import 'package:flutter/material.dart';

import '../popup_menu/crud_popup_menu.dart';
import 'menu_item.dart';

class CustomDropDownMenu<T> extends StatefulWidget {
  const CustomDropDownMenu({
    super.key,
    required this.callback,
    required this.itemList,
    required this.onSettingsTap,
    this.defaultValue,
    this.defaultHint,
    this.menuItemTextStyle,
    this.iconColor,
    this.iconData,
    this.iconSize,
    this.menuMaxHeight,
  });

  final List<MenuItem<T>> itemList;
  final Function(T?) callback;
  final MenuItem<T>? defaultValue;
  final String? defaultHint;
  final Function(T?, int index) onSettingsTap;
  final TextStyle? menuItemTextStyle;
  final Color? iconColor;
  final IconData? iconData;
  final double? iconSize;
  final double? menuMaxHeight;

  @override
  State<CustomDropDownMenu<T>> createState() => _CustomDropDownMenuState<T>();
}

class _CustomDropDownMenuState<T> extends State<CustomDropDownMenu<T>> {
  MenuItem<T>? defaultItem;

  @override
  void initState() {
    defaultItem = widget.defaultValue ?? widget.itemList[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<MenuItem<T>>(
      value: widget.defaultValue ?? widget.itemList[0],
      hint: Text(widget.defaultValue != null ? widget.defaultValue!.value : widget.defaultHint ?? ''),

      menuMaxHeight: widget.menuMaxHeight ?? 200,
      isExpanded: true,
      iconEnabledColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      focusColor: Theme.of(context).cardColor,
      //value: selectedClassCategory,

      icon: _getSettingsIcon(),
      onChanged: (MenuItem<T>? newValue) {
        if (newValue != null) {
          setState(() {
            widget.callback(newValue.model);
            defaultItem = newValue;
          });
        }
      },
      items: getItemList(),
    );
  }

  Widget _getSettingsIcon() {
    return CrudPopupMenu(
      iconData: Icons.edit_document,
      menuCallBack: (menuType) {
        switch (menuType) {
          case MenuType.add:
            widget.onSettingsTap(defaultItem!.model, 0);
            break;
          case MenuType.edit:
            widget.onSettingsTap(defaultItem!.model, 1);
            break;
          case MenuType.delete:
            widget.onSettingsTap(defaultItem!.model, 2);
            break;
        }
      },
    );
  }

  /*
CustomPopupMenuButton(
      menuList: [
        CustomPopupMenuButton.createMenuItem(
          context: context,
          iconData: Icons.add,
          title: 'Ekle',
          hasDivider: true,
          onTap: () {
            widget.onSettingsTap(defaultItem!.model, 0);
          },
        ),
        CustomPopupMenuButton.createMenuItem(
          context: context,
          iconData: Icons.edit,
          title: 'Düzenle',
          hasDivider: true,
          onTap: () {
            widget.onSettingsTap(defaultItem!.model, 1);
          },
        ),
        CustomPopupMenuButton.createMenuItem(
          context: context,
          iconData: Icons.delete,
          title: 'Sil',
          onTap: () {
            widget.onSettingsTap(defaultItem!.model, 2);
          },
        ),
      ],
      icon: const Icon(Icons.edit_document),
    );
  */

  List<DropdownMenuItem<MenuItem<T>>>? getItemList() {
    return widget.itemList.map<DropdownMenuItem<MenuItem<T>>>((MenuItem<T> value) {
      return DropdownMenuItem<MenuItem<T>>(
        value: value,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                widget.iconData ?? Icons.sort,
                size: widget.iconSize ?? 16,
                color: widget.iconColor,
              ),
            ),
            Expanded(
              child: Text(
                value.value,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
