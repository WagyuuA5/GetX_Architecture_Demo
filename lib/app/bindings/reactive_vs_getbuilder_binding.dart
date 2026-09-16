import 'package:get/get.dart';
import '../controllers/reactive_vs_getbuilder_controller.dart';

class ReactiveVsGetBuilderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReactiveVsGetBuilderController>(
      () => ReactiveVsGetBuilderController(),
    );
  }
}
