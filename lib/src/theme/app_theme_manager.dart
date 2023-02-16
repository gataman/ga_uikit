import 'package:flutter/material.dart';
import 'base_app_theme.dart';

class AppThemeManager {
  static AppThemeManager? _instance;

  AppThemeManager._();

  static get instance {
    _instance ??= AppThemeManager._();
    return _instance!;
  }

  ThemeData getTheme(BaseAppTheme appTheme) => ThemeData(
      useMaterial3: true,
      fontFamily: appTheme.fontFamily,

      //Colors
      primaryColor: appTheme.primaryColor,
      canvasColor: appTheme.canvasColor,
      cardColor: appTheme.cardColor,
      dividerColor: appTheme.dividerColor,
      colorScheme: appTheme.colorScheme,

      //Themes
      appBarTheme: appTheme.appBarTheme,
      bottomSheetTheme: appTheme.bottomSheetTheme,
      cardTheme: appTheme.cardTheme,
      drawerTheme: appTheme.drawerTheme,
      elevatedButtonTheme: appTheme.elevatedButtonTheme,
      inputDecorationTheme: appTheme.inputDecorationTheme,
      navigationDrawerTheme: appTheme.navigationDrawerTheme,
      navigationRailTheme: appTheme.navigationRailTheme,
      popupMenuTheme: appTheme.popupMenuTheme,
      tabBarTheme: appTheme.tabBarTheme,
      textTheme: appTheme.textTheme,
      dividerTheme: appTheme.dividerThemeData);
}
