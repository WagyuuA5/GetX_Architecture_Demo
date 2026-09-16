import 'package:get/get.dart';

import '../views/login_view.dart';
import '../views/product_list_view.dart';
import '../views/product_detail_view.dart';
import '../views/favorites_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      transition: Transition.fadeIn, // Custom transition 1
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => const ProductListView(),
      // Nested routes inside PRODUCTS
      children: [
        GetPage(
          name: _Paths.PRODUCT_DETAIL,
          page: () => const ProductDetailView(),
          transition: Transition.zoom, // Custom transition 2
        ),
        GetPage(
          name: _Paths.FAVORITES,
          page: () => const FavoritesView(),
          transition: Transition.cupertino,
        ),
      ],
    ),
  ];
}
