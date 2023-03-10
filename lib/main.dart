import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Bindings/bindings.dart';

import 'Pages/Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      title: 'Mauro Rodrigues',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}
