import 'package:flutter/material.dart';

abstract class BaseAppTheme {
  ColorScheme? get colorScheme;
  Color? get primaryColor;
  Color? get canvasColor;
  Color? get cardColor;
  String? get fontFamily;

  AppBarTheme? get appBarTheme;
  TextTheme? get textTheme;
  CardTheme? get cardTheme;
  InputDecorationTheme? get inputDecorationTheme;
  ElevatedButtonThemeData? get elevatedButtonTheme;
  PopupMenuThemeData? get popupMenuTheme;
  DrawerThemeData? get drawerTheme;
  NavigationDrawerThemeData? get navigationDrawerTheme;
  TabBarTheme get tabBarTheme;
  BottomSheetThemeData? get bottomSheetTheme;
  Color? get dividerColor;
  NavigationRailThemeData? get navigationRailTheme;
  DividerThemeData? get dividerThemeData;
}
