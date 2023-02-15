import 'package:flutter/material.dart';

class GaTabBar extends StatelessWidget {
  const GaTabBar({super.key, required this.titleList, required this.controller});
  final List<String> titleList;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: titleList.map((e) => Tab(text: e)).toList(),
    );
  }
}
