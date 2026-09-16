import 'package:get/get.dart';

class ReactiveVsGetBuilderController extends GetxController {
  // --- Reactive (.obs) ---
  final reactiveCounter = 0.obs;

  void incrementReactive() {
    reactiveCounter.value++;
  }

  // --- GetBuilder (Manual) ---
  int manualCounter = 0;

  void incrementManual() {
    manualCounter++;
    update(['manual_counter']); // Only update widgets with this ID
  }
}
