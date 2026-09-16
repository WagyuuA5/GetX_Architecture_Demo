import 'package:get/get.dart';
import '../controllers/playground_controller.dart';

class BindingsPlaygroundBinding extends Bindings {
  @override
  void dependencies() {
    // 1. lazyPut: Controller is created ONLY when it is used/find for the first time.
    // It's destroyed when the route is popped (unless fenix: true).
    Get.lazyPut<LazyController>(() => LazyController(), fenix: true);

    // 2. put: Controller is created IMMEDIATELY when the binding is initialized.
    Get.put<PutController>(PutController());

    // 3. putAsync: Controller is created asynchronously. Usually for services like SharedPreferences.
    Get.putAsync<AsyncController>(() async {
      await Future.delayed(const Duration(seconds: 2));
      return AsyncController();
    });
  }
}
