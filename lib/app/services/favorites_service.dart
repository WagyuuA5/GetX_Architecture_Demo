import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/models/product_model.dart';
import 'dart:convert';

class FavoritesService extends GetxService {
  late final GetStorage _box;
  final String _key = 'favorites';
  
  // Observable map: productId -> Product
  final favorites = <int, Product>{}.obs;

  Future<FavoritesService> init() async {
    if (Get.testMode) return this;
    _box = GetStorage();
    final String? data = _box.read(_key);
    if (data != null && data.isNotEmpty) {
      try {
        final Map<String, dynamic> decoded = jsonDecode(data);
        decoded.forEach((key, value) {
          favorites[int.parse(key)] = Product.fromJson(value);
        });
      } catch (e) {
        print('Error parsing favorites: $e');
      }
    }
    return this;
  }

  bool isFavorite(int productId) {
    return favorites.containsKey(productId);
  }

  void toggleFavorite(Product product) {
    if (favorites.containsKey(product.id)) {
      favorites.remove(product.id);
    } else {
      favorites[product.id] = product;
    }
    _saveToStorage();
  }

  void _saveToStorage() {
    if (Get.testMode) return;
    final Map<String, dynamic> dataToSave = {};
    favorites.forEach((key, value) {
      // Need a toJson method in Product model, or we can just build the map here
      dataToSave[key.toString()] = {
        'id': value.id,
        'title': value.title,
        'price': value.price,
        'image': value.image,
        'description': value.description,
      };
    });
    _box.write(_key, jsonEncode(dataToSave));
  }
}
