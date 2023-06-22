import 'package:flutter/material.dart';
import 'src/ga_navigation_item.dart';

part 'src/ga_navigation_drawer.dart';
part 'src/ga_navigation_rail.dart';

class GaNavigationMenu extends StatelessWidget {
  const GaNavigationMenu({
    super.key,
    required this.itemList,
    required this.onItemSelected,
    this.drawer = false,
    this.isExtended = false,
    this.drawerWidth = 256,
    this.extendedWidth = 192,
    this.width = 112,
    this.itemTextStyle,
    this.navigationRailPadding,
    this.currentIndex = 0,
  });

  //192 : 112

  final List<GaNavigationItem> itemList;
  final Function(String route) onItemSelected;

  final bool drawer;
  final bool isExtended;
  final double drawerWidth;
  final double extendedWidth;
  final double width;

  final TextStyle? itemTextStyle;
  final EdgeInsetsGeometry? navigationRailPadding;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    if (drawer) {
      return _DrawerContainer(
        drawerWith: drawerWidth,
        child: GaNavigationRail(
          itemList: itemList,
          isExtended: isExtended,
          onItemSelected: onItemSelected,
          currentIndex: currentIndex,
        ),
      );
    } else {
      return _RailContainer(
        width: isExtended ? extendedWidth : width,
        navigationRailPadding: navigationRailPadding,
        child: GaNavigationRail(
          itemList: itemList,
          isExtended: isExtended,
          onItemSelected: onItemSelected,
          currentIndex: currentIndex,
        ),
      );
    }
  }
}

class _RailContainer extends StatelessWidget {
  const _RailContainer({
    required this.child,
    required this.width,
    this.navigationRailPadding,
  });
  final Widget child;
  final double width;
  final EdgeInsetsGeometry? navigationRailPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: width,
      child: Padding(
        padding: navigationRailPadding ?? const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
        child: Card(
          color: Colors.transparent,
          elevation: null,
          child: child,
        ),
      ),
    );
  }
}

class _DrawerContainer extends StatelessWidget {
  const _DrawerContainer({required this.drawerWith, required this.child});
  final double drawerWith;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: drawerWith,
      child: Drawer(
        child: child,
      ),
    );
  }
}
