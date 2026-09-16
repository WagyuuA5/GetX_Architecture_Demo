import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.offNamed(Routes.PRODUCTS),
              child: const Text('Go to Products (Protected)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.PLAYGROUND),
              child: const Text('Go to Bindings Playground'),
            ),
          ],
        ),
      ),
    );
  }
}
