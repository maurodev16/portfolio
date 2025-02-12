import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: const Color.fromARGB(255, 22, 29, 36),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Coluna da esquerda (Texto + Redes Sociais)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.2),
                Text(
                  'welcome'.tr, // 🌍 Tradução
                  style: GoogleFonts.playfair(
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.waving_hand,
                      color: Colors.amber,
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'hello'.tr, // 🌍 Tradução
                      style: GoogleFonts.playfair(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'name'.tr.toUpperCase(), // 🌍 Tradução do nome
                  style: GoogleFonts.playfair(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'role'.tr, // 🌍 Tradução do cargo
                  style: GoogleFonts.orbitron(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.twitter),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Coluna da direita (Imagem com Fade-in)
          Expanded(
            child: TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double opacity, child) {
                return Opacity(
                  opacity: opacity,
                  child: child,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/minha_foto.png', // 🖼️ Coloque sua foto aqui
                    height: Get.height * 0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
