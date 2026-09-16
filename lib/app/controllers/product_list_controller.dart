import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../data/models/product_model.dart';

class ProductListController extends GetxController {
  final Dio _dio = Dio();
  
  // State
  final products = <Product>[].obs;
  final isLoading = true.obs;
  final hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    hasError.value = false;
    
    try {
      // Using fakestoreapi for dummy data
      final response = await _dio.get('https://fakestoreapi.com/products?limit=10');
      
      if (response.statusCode == 200) {
        final List data = response.data;
        products.value = data.map((e) => Product.fromJson(e)).toList();
      } else {
        hasError.value = true;
      }
    } catch (e) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  // Pull to refresh
  Future<void> refreshData() async {
    await fetchProducts();
  }
}
