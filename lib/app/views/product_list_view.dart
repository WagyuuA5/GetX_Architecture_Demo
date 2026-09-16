import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import '../controllers/product_list_controller.dart';
import '../services/session_service.dart';
import '../services/favorites_service.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  child: SafeArea(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.arrow_upward),
                          title: const Text('Sort A-Z (Demo)'),
                          onTap: () {
                            Get.back();
                            Get.snackbar('Sort', 'Sorting feature coming soon');
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.arrow_downward),
                          title: const Text('Sort Z-A (Demo)'),
                          onTap: () {
                            Get.back();
                            Get.snackbar('Sort', 'Sorting feature coming soon');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Get.toNamed(Routes.FAVORITES),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.defaultDialog(
                title: 'Confirm Logout',
                middleText: 'Are you sure you want to log out?',
                textConfirm: 'Yes',
                textCancel: 'No',
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.find<SessionService>().logout();
                  Get.offAllNamed(Routes.LOGIN);
                },
              );
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Failed to load products', style: TextStyle(color: Colors.red)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: controller.fetchProducts,
                  child: const Text('Retry'),
                )
              ],
            ),
          );
        }

        if (controller.products.isEmpty) {
          return const Center(child: Text('No products available.'));
        }

        return RefreshIndicator(
          onRefresh: controller.refreshData,
          child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
                  ),
                  title: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: Obx(() {
                    final isFav = Get.find<FavoritesService>().isFavorite(product.id);
                    return IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : null,
                      ),
                      onPressed: () => Get.find<FavoritesService>().toggleFavorite(product),
                    );
                  }),
                  onTap: () => Get.toNamed(
                    Routes.PRODUCT_DETAIL, 
                    arguments: {'id': product.id, 'title': product.title},
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
