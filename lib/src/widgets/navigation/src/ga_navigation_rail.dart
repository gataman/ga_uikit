part of '../ga_navigation_menu.dart';

class GaNavigationRail extends StatefulWidget {
  const GaNavigationRail({
    super.key,
    required this.itemList,
    required this.onItemSelected,
    required this.isExtended,
    this.itemTextStyle,
    required this.currentIndex,
  });
  final List<GaNavigationItem> itemList;
  final Function(String route) onItemSelected;
  final bool isExtended;
  final TextStyle? itemTextStyle;
  final int currentIndex;

  @override
  State<GaNavigationRail> createState() => _GaNavigationRailState();
}

class _GaNavigationRailState extends State<GaNavigationRail> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Colors.transparent,
      elevation: null,
      destinations: widget.itemList
          .map(
            (e) => NavigationRailDestination(
              padding: EdgeInsets.zero,
              icon: e.icon ?? const Icon(Icons.dashboard),
              label: Text(
                e.label,
                style: widget.itemTextStyle ?? Theme.of(context).textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
          widget.onItemSelected(widget.itemList[index].route);
        });
      },
      labelType: widget.isExtended ? NavigationRailLabelType.none : NavigationRailLabelType.selected,
      extended: widget.isExtended,
    );
  }
}
