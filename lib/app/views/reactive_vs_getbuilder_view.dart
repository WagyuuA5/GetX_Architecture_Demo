import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reactive_vs_getbuilder_controller.dart';

class ReactiveVsGetBuilderView extends GetView<ReactiveVsGetBuilderController> {
  const ReactiveVsGetBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // OBSERVATION:
    // GetBuilder is faster and uses less memory because it's a simple StatefulWidget
    // under the hood. It doesn't use Streams or Listenables. Best for lists or 
    // static data that changes rarely.
    //
    // Obx (Reactive) uses Streams. It is extremely granular—only the specific widget
    // wrapped in Obx will rebuild, but it consumes more memory. Best for single 
    // variables that change frequently.

    return Scaffold(
      appBar: AppBar(title: const Text('Reactive vs GetBuilder')),
      body: Row(
        children: [
          // Reactive Section
          Expanded(
            child: Container(
              color: Colors.blue.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Obx (Reactive)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Obx(() {
                    print('🔄 Obx Rebuild!');
                    return Text(
                      '${controller.reactiveCounter.value}',
                      style: const TextStyle(fontSize: 48),
                    );
                  }),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.incrementReactive,
                    child: const Text('Increment'),
                  ),
                ],
              ),
            ),
          ),
          
          // GetBuilder Section
          Expanded(
            child: Container(
              color: Colors.green.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('GetBuilder', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  GetBuilder<ReactiveVsGetBuilderController>(
                    id: 'manual_counter',
                    builder: (ctrl) {
                      print('🔄 GetBuilder Rebuild!');
                      return Text(
                        '${ctrl.manualCounter}',
                        style: const TextStyle(fontSize: 48),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.incrementManual,
                    child: const Text('Increment'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
