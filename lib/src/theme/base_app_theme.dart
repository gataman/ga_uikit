import 'package:flutter/material.dart';

abstract class BaseAppTheme {
  ColorScheme? get colorScheme => null;
  Color? get primaryColor => null;
  Color? get canvasColor => null;
  Color? get cardColor => null;
  String? get fontFamily => null;

  AppBarTheme? get appBarTheme => null;
  TextTheme? get textTheme => null;
  CardTheme? get cardTheme => null;
  InputDecorationTheme? get inputDecorationTheme => null;
  ElevatedButtonThemeData? get elevatedButtonTheme => null;
  PopupMenuThemeData? get popupMenuTheme => null;
  DrawerThemeData? get drawerTheme => null;
  NavigationDrawerThemeData? get navigationDrawerTheme => null;
  TabBarTheme? get tabBarTheme => null;
  BottomSheetThemeData? get bottomSheetTheme => null;
  Color? get dividerColor => null;
  NavigationRailThemeData? get navigationRailTheme => null;
  DividerThemeData? get dividerThemeData => null;
  DialogTheme? get dialogTheme => null;
  Iterable<ThemeExtension<dynamic>>? get customColorExtensions => null;
  FloatingActionButtonThemeData? get floatingActionButtonThemeData => null;
}
