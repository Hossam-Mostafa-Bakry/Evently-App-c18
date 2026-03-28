import 'package:flutter/material.dart';

class AppSettingsController extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  /// Sets the current language to [newLanguage].
  ///
  /// If [newLanguage] is the same as the current language, this method does nothing.
  ///
  /// Otherwise, it sets the current language and notifies the listeners.
  void setCurrentLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;

    currentLanguage = newLanguage;

    notifyListeners();
  }

  /// Sets the current theme to [newTheme].
  ///
  /// If [newTheme] is the same as the current theme, this method does nothing.
  ///
  /// Otherwise, it sets the current theme and notifies the listeners.
  ///
  /// The [newTheme] parameter is of type [ThemeMode]. It determines the current
  /// theme mode, which can be either [ThemeMode.light], [ThemeMode.dark], or
  /// [ThemeMode.system].
  void setCurrentTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;

    currentTheme = newTheme;
    notifyListeners();
  }


  /// Returns `true` if the current theme is dark, `false` otherwise.
  ///
  /// This method checks if the current theme is equal to [ThemeMode.dark].
  ///
  /// Returns:
  ///   * `true` if the current theme is [ThemeMode.dark].
  ///   * `false` if the current theme is [ThemeMode.light] or [ThemeMode.system].
  bool isDark() => currentTheme == ThemeMode.dark;
}
