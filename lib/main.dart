import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/language/translations.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Locale('en', 'US'), // Idioma padrão
      fallbackLocale: Locale('en', 'US'),
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
      darkTheme: ThemeData.dark(),
    );
  }
}
