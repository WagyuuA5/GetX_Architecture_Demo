import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../data/models/product_model.dart';
import '../services/favorites_service.dart';

class ProductDetailController extends GetxController {
  final Dio _dio = Dio();
  
  final product = Rxn<Product>();
  final isLoading = true.obs;
  final hasError = false.obs;

  late final int productId;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null && args['id'] != null) {
      productId = args['id'];
      fetchProductDetail();
    } else {
      hasError.value = true;
      isLoading.value = false;
    }
  }

  Future<void> fetchProductDetail() async {
    isLoading.value = true;
    hasError.value = false;
    
    try {
      final response = await _dio.get('https://fakestoreapi.com/products/$productId');
      if (response.statusCode == 200) {
        product.value = Product.fromJson(response.data);
      } else {
        hasError.value = true;
      }
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite() {
    if (product.value == null) return;
    final favService = Get.find<FavoritesService>();
    favService.toggleFavorite(product.value!);
    final isFav = favService.isFavorite(product.value!.id);
    Get.snackbar(
      isFav ? 'Added to Favorites' : 'Removed from Favorites',
      '${product.value?.title} was ${isFav ? "added to" : "removed from"} favorites!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
