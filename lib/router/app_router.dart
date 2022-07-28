import '../core/constants.dart';
import '../core/core.dart';
import '../screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppStrings.loginScreen:
        return LoginScreen.route();
      case AppStrings.initialHomeScreen:
        return InitialHomeScreen.route();
      case AppStrings.locationPermissionScreen:
        return LocationPermissionScreen.route();
      case AppStrings.smsPermissionScreen:
        return SMSPermissionScreen.route();
      case AppStrings.homeScreen:
        return HomeScreen.route();
      default:
        return LoginScreen.route();
    }
  }
}
