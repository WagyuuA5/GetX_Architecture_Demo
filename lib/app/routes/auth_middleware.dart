import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_pages.dart';
import '../services/session_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Get the SessionService that is guaranteed to be initialized before runApp
    final session = Get.find<SessionService>();

    if (!session.isAuthenticated) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
