import 'package:evently_app/core/config/routes/pages_route_name.dart';
import 'package:evently_app/modules/on_boarding/on_boarding_view.dart';
import 'package:evently_app/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
      case PagesRouteName.onBoardingConfig:
        return MaterialPageRoute(
          builder: (context) => OnBoardingView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: settings,
        );
    }
  }
}
