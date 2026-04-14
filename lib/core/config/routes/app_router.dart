import 'package:evently_app/core/config/routes/pages_route_name.dart';
import 'package:evently_app/modules/authentication/sigin_in/sign_in_view.dart';
import 'package:evently_app/modules/authentication/sign_up/sign_up_view.dart';
import 'package:evently_app/modules/create_event/create_event_view.dart';
import 'package:evently_app/modules/layout/layout_view.dart';
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
      case PagesRouteName.signIn:
        return MaterialPageRoute(
          builder: (context) => SignInView(),
          settings: settings,
        );
      case PagesRouteName.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpView(),
          settings: settings,
        );
      case PagesRouteName.home:
        return MaterialPageRoute(
          builder: (context) => LayoutView(),
          settings: settings,
        );
      case PagesRouteName.createEvent:
        return MaterialPageRoute(
          builder: (context) => CreateEventView(),
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
