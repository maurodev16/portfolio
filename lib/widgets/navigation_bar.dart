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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.black.withValues(alpha: 0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '< Rodrigues />',
            style: GoogleFonts.greatVibes(
              fontSize: 40,
              letterSpacing: 2,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => _scrollToSection(0),
                child: Text(
                  'home'.tr,
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(1),
                child: Text(
                  'projects'.tr,
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(2),
                child: Text(
                  'about'.tr,
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () => _scrollToSection(3),
                child: Text(
                  'contact'.tr,
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
