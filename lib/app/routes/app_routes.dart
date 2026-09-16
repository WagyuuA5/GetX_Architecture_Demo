part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  
  static const LOGIN = _Paths.LOGIN;
  static const PRODUCTS = _Paths.PRODUCTS;
  static const PRODUCT_DETAIL = _Paths.PRODUCTS + _Paths.PRODUCT_DETAIL;
  static const FAVORITES = _Paths.PRODUCTS + _Paths.FAVORITES; 
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const PRODUCTS = '/products';
  static const PRODUCT_DETAIL = '/detail'; // Nested
  static const FAVORITES = '/favorites'; // Nested
}
