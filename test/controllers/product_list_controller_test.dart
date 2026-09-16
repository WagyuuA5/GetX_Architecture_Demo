import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_demo/app/controllers/product_list_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.reset();
  });

  test('ProductListController initializes correctly', () {
    // We only test the initial state before API call finishes
    final controller = ProductListController();
    
    // We don't call onInit() explicitly because Get.put does it, 
    // but here we just test initial field values
    expect(controller.products.isEmpty, true);
    expect(controller.isLoading.value, true);
    expect(controller.hasError.value, false);
  });
}
