import 'package:flutter/material.dart';
import '../pages/information_page.dart';
import '../pages/main/main_page.dart';
import '../pages/settings/settings_page.dart';

class RouteManager {
  static const String homePage = '/';
  static const String ticketDetailsPage = '/ticketDetailsPage';
  static const String settingsPage = '/settingsPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? arguments;

    if (settings.arguments != null) {
      arguments = settings.arguments as Map<String, dynamic>;
    }

    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case ticketDetailsPage:
        return MaterialPageRoute(
            builder: (context) =>
                InformationPage(ticketID: arguments!["ticketID"]));
      case settingsPage:
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      default:
        throw const FormatException("Route not found!");
    }
  }
}
