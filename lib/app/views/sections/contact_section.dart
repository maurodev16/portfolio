import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: Colors.purple[100],
      child: Center(
        child: Text(
          'contact_section'.tr, // Traduzido
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
