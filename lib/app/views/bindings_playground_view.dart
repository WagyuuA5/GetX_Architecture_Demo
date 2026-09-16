import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/playground_controller.dart';

class BindingsPlaygroundView extends StatelessWidget {
  const BindingsPlaygroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bindings Playground')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Check console logs to see injection timings!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Instantiates LazyController because of lazyPut
                Get.find<LazyController>();
                Get.snackbar('LazyController', 'Instantiated / Found!');
              },
              child: const Text('Find LazyController (lazyPut)'),
            ),
            ElevatedButton(
              onPressed: () {
                // PutController is already instantiated
                Get.find<PutController>();
                Get.snackbar('PutController', 'Found!');
              },
              child: const Text('Find PutController (put)'),
            ),
            ElevatedButton(
              onPressed: () {
                // Wait for async controller to be ready
                Get.find<AsyncController>();
                Get.snackbar('AsyncController', 'Found!');
              },
              child: const Text('Find AsyncController (putAsync)'),
            ),
          ],
        ),
      ),
    );
  }
}
