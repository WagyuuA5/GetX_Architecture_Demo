import 'package:get/get.dart';

import '../views/login_view.dart';
import '../views/product_list_view.dart';
import '../views/product_detail_view.dart';
import '../views/favorites_view.dart';
import 'auth_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => const ProductListView(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.PRODUCT_DETAIL,
          page: () => const ProductDetailView(),
          transition: Transition.zoom,
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
