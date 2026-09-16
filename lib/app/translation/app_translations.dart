import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'Login',
          'email': 'Email',
          'password': 'Password',
          'products': 'Products',
          'favorites': 'Favorites',
          'logout': 'Logout',
          'confirm_logout': 'Are you sure you want to log out?',
          'yes': 'Yes',
          'no': 'No',
          'change_language': 'Change Language',
        },
        'id_ID': {
          'login': 'Masuk',
          'email': 'Surel',
          'password': 'Kata Sandi',
          'products': 'Produk',
          'favorites': 'Favorit',
          'logout': 'Keluar',
          'confirm_logout': 'Apakah Anda yakin ingin keluar?',
          'yes': 'Ya',
          'no': 'Tidak',
          'change_language': 'Ubah Bahasa',
        }
      };
}
