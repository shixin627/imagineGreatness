import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments); // 輸入會被轉成RouteSettings
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}

Route doGenerateRoute(RouteSettings settings) { // 輸入變數類型為RouteSettings，返回類型是Route
  if (settings.name?.isNotEmpty != true) return null;
  final path = settings.name;
  switch (path) {
    case "":
      {
        return _buildRoute((context) => null);
      }
    default:
      return null;
  }
}

/// Create a [Route].
Route _buildRoute(WidgetBuilder builder) => MaterialPageRoute<void>(
      builder: builder,
    );
