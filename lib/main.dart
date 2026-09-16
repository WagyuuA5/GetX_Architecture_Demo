import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/services/session_service.dart';
import 'app/services/favorites_service.dart';
import 'app/translation/app_translations.dart';

Future<void> initServices() async {
  print('Starting services...');
  if (!Get.testMode) {
    await GetStorage.init();
  }
  await Get.putAsync(() => SessionService().init());
  await Get.putAsync(() => FavoritesService().init());
  print('All services started...');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(
    GetMaterialApp(
      title: "GetX Architecture Demo",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
      translations: AppTranslations(),
      locale: Get.deviceLocale ?? const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
    ),
  );
}
