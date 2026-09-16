import 'package:get/get.dart';

import '../views/login_view.dart';
import '../views/product_list_view.dart';
import '../views/product_detail_view.dart';
import '../views/favorites_view.dart';
import '../views/bindings_playground_view.dart';
import '../bindings/login_binding.dart';
import '../bindings/product_list_binding.dart';
import '../bindings/product_detail_binding.dart';
import '../bindings/favorites_binding.dart';
import '../bindings/bindings_playground_binding.dart';
import 'auth_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PLAYGROUND,
      page: () => const BindingsPlaygroundView(),
      binding: BindingsPlaygroundBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.PRODUCT_DETAIL,
          page: () => const ProductDetailView(),
          binding: ProductDetailBinding(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: _Paths.FAVORITES,
          page: () => const FavoritesView(),
          binding: FavoritesBinding(),
          transition: Transition.cupertino,
        ),
      ],
    ),
  ];
}
