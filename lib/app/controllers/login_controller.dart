import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/session_service.dart';
import '../routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Mock validation
      if (emailController.text == 'admin@test.com' && passwordController.text == 'password') {
        final session = Get.find<SessionService>();
        session.login();
        Get.offAllNamed(Routes.PRODUCTS);
      } else {
        errorMessage.value = 'Invalid email or password. Use admin@test.com / password';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred';
    } finally {
      isLoading.value = false;
    }
  }
}
