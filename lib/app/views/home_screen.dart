import 'package:flutter/material.dart';
import '../../widgets/navigation_bar.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/home_section.dart';
import 'sections/projects_section.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            CustomNavBar(scrollController: scrollController),
            HomeSection(),
            ProjectsSection(),
            AboutSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
