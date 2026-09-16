import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  // Temporary flag for authentication status.
  // Will be replaced by SessionService in PR 6.
  bool isAuthenticated = false;

  @override
  RouteSettings? redirect(String? route) {
    if (!isAuthenticated) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
