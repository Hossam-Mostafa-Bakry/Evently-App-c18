import 'package:evently_app/core/utils/provider/app_settings_controller.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:evently_app/core/config/routes/app_router.dart';
import 'package:evently_app/core/config/routes/pages_route_name.dart';
import 'package:evently_app/core/config/theme/app_theme_manager.dart';
import 'package:provider/provider.dart';

/// 1- Language
/// 2- Theme
/// 3- State Management [Provider]
/// 4- Authentication [Firebase FireAuth]
/// 5- [Firebase Firestore] CRUD Operation

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettingsController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appSettingsController = Provider.of<AppSettingsController>(context);
    return MaterialApp(
      theme: AppThemeManager.lightTheme(),
      darkTheme: AppThemeManager.darkTheme(),
      themeMode: appSettingsController.currentTheme,
      initialRoute: PagesRouteName.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      locale: Locale(appSettingsController.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
