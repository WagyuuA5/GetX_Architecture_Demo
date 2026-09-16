import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final productId = args['id'] ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(title: Text('Product Detail $productId')),
      body: Center(
        child: Text('Detail for product $productId'),
      ),
    );
  }
}
