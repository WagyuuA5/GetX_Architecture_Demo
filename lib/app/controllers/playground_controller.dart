import 'package:get/get.dart';

class LazyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('✅ LazyController: onInit called');
  }

  @override
  void onClose() {
    print('❌ LazyController: onClose called');
    super.onClose();
  }
}

class PutController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('✅ PutController: onInit called');
  }

  @override
  void onClose() {
    print('❌ PutController: onClose called');
    super.onClose();
  }
}

class AsyncController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('✅ AsyncController: onInit called');
  }

  @override
  void onClose() {
    print('❌ AsyncController: onClose called');
    super.onClose();
  }
}
