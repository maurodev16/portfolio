import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavBar extends StatelessWidget {
  final ScrollController scrollController;

  CustomNavBar({required this.scrollController});

  void _scrollToSection(int sectionIndex) {
    final double offset = sectionIndex * Get.height;
    scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Verifica se está em modo mobile (largura < 600)
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.black..withValues(alpha: 0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '< Rodrigues />',
            style: GoogleFonts.greatVibes(
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
          if (!isMobile)
            // Menu para Desktop
            Row(
              children: [
                _buildNavButton('home'.tr, 0),
                SizedBox(width: 20),
                _buildNavButton('projects'.tr, 1),
                SizedBox(width: 20),
                _buildNavButton('about'.tr, 2),
                SizedBox(width: 20),
                _buildNavButton('contact'.tr, 3),
                SizedBox(width: 20),
                _buildNavButton('Flutter tips'.tr, 4),
              ],
            )
          else
            // Menu Hamburger para Mobile
            PopupMenuButton<int>(
              icon: Icon(Icons.menu, color: Colors.white),
              color: Colors.black..withValues(alpha: 0.9),
              onSelected: _scrollToSection,
              itemBuilder: (BuildContext context) => [
                _buildPopupMenuItem('home'.tr, 0),
                _buildPopupMenuItem('projects'.tr, 1),
                _buildPopupMenuItem('about'.tr, 2),
                _buildPopupMenuItem('contact'.tr, 3),
                _buildPopupMenuItem('Flutter Tips'.tr, 4),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildNavButton(String text, int section) {
    return TextButton(
      onPressed: () => _scrollToSection(section),
      child: Text(
        text,
        style: GoogleFonts.playfair(
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(String text, int section) {
    return PopupMenuItem<int>(
      value: section,
      child: Text(
        text,
        style: GoogleFonts.playfair(
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
