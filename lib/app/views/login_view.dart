import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(labelText: 'email'.tr, border: const OutlineInputBorder()),
                    validator: (val) => val == null || val.isEmpty ? 'Please enter email' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(labelText: 'password'.tr, border: const OutlineInputBorder()),
                    obscureText: true,
                    validator: (val) => val == null || val.isEmpty ? 'Please enter password' : null,
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    if (controller.errorMessage.value.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: controller.login,
                      child: Text('login'.tr),
                    );
                  }),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Text('Demos:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.PLAYGROUND),
                    child: const Text('Go to Bindings Playground'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.STATE_MANAGEMENT),
                    child: const Text('Go to Reactive vs GetBuilder'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
