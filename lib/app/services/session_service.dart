import 'package:get/get.dart';

class SessionService extends GetxService {
  // Use .obs so that if we ever want the UI to react to login state changes,
  // we can use Obx.
  final RxBool _isAuthenticated = false.obs;

  bool get isAuthenticated => _isAuthenticated.value;

  // Initialize service asynchronously, e.g. checking secure storage
  Future<SessionService> init() async {
    print('✅ SessionService is initializing...');
    if (!Get.testMode) {
      await Future.delayed(const Duration(seconds: 1)); // Simulate local storage read
    }
    // For now we start as not authenticated
    _isAuthenticated.value = false;
    print('✅ SessionService initialized!');
    return this;
  }

  void login() {
    _isAuthenticated.value = true;
  }

  void logout() {
    _isAuthenticated.value = false;
  }
}
