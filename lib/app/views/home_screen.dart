import 'package:flutter/material.dart';
import 'package:portfolio_flutter/app/views/sections/flutter_tips_section.dart';
import '../../widgets/navigation_bar.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/home_section.dart';
import 'sections/projects_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  bool showBackToTop = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >= 400) {
        if (!showBackToTop) {
          setState(() {
            showBackToTop = true;
          });
        }
      } else {
        if (showBackToTop) {
          setState(() {
            showBackToTop = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
            FlutterTipsSection(),
          ],
        ),
      ),
      // Botão flutuante fixo no canto inferior direito
      floatingActionButton: AnimatedOpacity(
        opacity: showBackToTop ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: Visibility(
          visible: showBackToTop,
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            child: Container(
              width: 56, // Tamanho padrão do FAB
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withValues(alpha: 0.7),
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
