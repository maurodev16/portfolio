import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: const Color.fromARGB(255, 77, 89, 78),
      child: Center(
        child: Text(
          'projects_section'.tr, // Traduzido
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
