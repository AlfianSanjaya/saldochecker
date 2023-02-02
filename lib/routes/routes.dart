import 'package:flutter/material.dart';
import 'package:saldochecker/information_page.dart';
import 'package:saldochecker/main_page.dart';

class RouteManager {
  static const String homePage = '/';
  static const String ticketDetailsPage = '/ticketDetailsPage';
  static const String settingsPage = '/settingsPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments;

    if (settings.arguments != null) {
      arguments = settings.arguments as Map<String, dynamic>;
    }

    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case ticketDetailsPage:
        return MaterialPageRoute(
            builder: (context) =>
                InformationPage(ticketID: arguments["ticketID"]));
      default:
        throw FormatException("Route not found!");
    }
  }
}
