import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: const Color.fromARGB(255, 23, 20, 14),
      child: Center(
        child: Text(
          'about_section'.tr, // Traduzido
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
