import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_architecture_demo/app/controllers/favorites_controller.dart';
import 'package:getx_architecture_demo/app/services/favorites_service.dart';
import 'package:getx_architecture_demo/app/data/models/product_model.dart';

void main() {
  setUp(() {
    // Reset GetX before each test
    Get.reset();
    Get.testMode = true;
  });

  test('FavoritesController retrieves favorites from service correctly', () async {
    // 1. Arrange: Inject Service with dummy data
    final mockService = FavoritesService();
    mockService.favorites[1] = Product(id: 1, title: 'Test Product', price: 10.0, image: '');
    Get.put<FavoritesService>(mockService);

    // 2. Act: Initialize Controller
    final controller = FavoritesController();
    Get.put(controller);

    // 3. Assert: Check if controller gets the data
    expect(controller.favorites.length, 1);
    expect(controller.favorites.first.title, 'Test Product');
  });

  test('FavoritesController removes favorite via service', () async {
    final mockService = FavoritesService();
    final product = Product(id: 1, title: 'Test Product', price: 10.0, image: '');
    mockService.favorites[1] = product;
    Get.put<FavoritesService>(mockService);

    final controller = FavoritesController();
    Get.put(controller);

    expect(controller.favorites.length, 1);

    // Act
    controller.removeFavorite(product);

    // Assert
    expect(controller.favorites.length, 0);
    expect(mockService.favorites.containsKey(1), false);
  });
}
