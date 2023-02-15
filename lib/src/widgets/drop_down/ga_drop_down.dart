import 'package:flutter/material.dart';
part 'menu_item.dart';

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.callback,
    required this.itemList,
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
  final TextStyle? menuItemTextStyle;

  final Color? iconColor;
  final IconData? iconData;
  final double? iconSize;

  final double? menuMaxHeight;

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<MenuItem<T>>(
      value: widget.defaultValue ?? widget.itemList[0],
      hint: Text(widget.defaultValue != null ? widget.defaultValue!.value : widget.defaultHint ?? ''),
      menuMaxHeight: widget.menuMaxHeight ?? 200,
      isExpanded: false,
      iconEnabledColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      dropdownColor: Theme.of(context).cardColor,
      focusColor: Theme.of(context).cardColor,
      //value: selectedClassCategory,

      icon: const Icon(Icons.keyboard_arrow_down),
      onChanged: (MenuItem<T>? newValue) {
        if (newValue != null) {
          widget.callback(newValue.model);
        }
      },
      items: _getItemList(),
    );
  }

  List<DropdownMenuItem<MenuItem<T>>>? _getItemList() {
    return widget.itemList.map<DropdownMenuItem<MenuItem<T>>>((MenuItem<T> value) {
      return DropdownMenuItem<MenuItem<T>>(
        value: value,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                Icons.sort,
                size: widget.iconSize ?? 16,
                color: widget.iconColor,
              ),
            ),
            Text(
              value.value,
              style: widget.menuItemTextStyle ?? const TextStyle(fontSize: 14),
            ),
          ],
        ),
      );
    }).toList();
  }
}
