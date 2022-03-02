import 'package:flutter/material.dart';
import 'package:github_profile/screens/home_screen.dart';
import 'package:github_profile/screens/repo_webview.dart';
import 'package:github_profile/screens/user_details.dart';

class AppRoutes {
  static const String home = '/';
  static const String userDetails = 'user_details';
  static const String webView = '/web_view';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildRoute(HomeScreen(), settings);
      case userDetails:
        return _buildRoute(UserDetailsScreen(), settings);
      case webView:
        return _buildRoute(ReposWebView(), settings);
      default:
        return _buildRoute(const Scaffold(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
