import 'package:get/get.dart';
import '../services/favorites_service.dart';
import '../data/models/product_model.dart';

class FavoritesController extends GetxController {
  final FavoritesService _favoritesService = Get.find<FavoritesService>();

  List<Product> get favorites => _favoritesService.favorites.values.toList();

  void removeFavorite(Product product) {
    _favoritesService.toggleFavorite(product);
  }
}
