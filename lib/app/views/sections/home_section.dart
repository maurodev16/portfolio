import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Detecta se está em modo mobile
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: Get.height,
      color: const Color.fromARGB(255, 22, 29, 36),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 20 : 0,
      ),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Imagem no topo para mobile
        Expanded(
          flex: 4,
          child: _buildProfileImage(),
        ),
        // Conteúdo de texto
        Expanded(
          flex: 6,
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Coluna da esquerda (Texto + Redes Sociais)
        Expanded(child: _buildContent()),
        // Coluna da direita (Imagem)
        Expanded(child: _buildProfileImage()),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'welcome'.tr,
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
              'hello'.tr,
              style: GoogleFonts.playfair(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          'Mauro Rodrigues'.toUpperCase(),
          style: GoogleFonts.playfair(
            fontSize: 20,
            wordSpacing: 1,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'role'.tr,
          style: GoogleFonts.playfair(
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
              onPressed: () => _launchURL(),
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
    );
  }

  Widget _buildProfileImage() {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double opacity, child) {
        return Opacity(
          opacity: opacity,
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 217, 179, 179)
                  .withValues(alpha: 0.5),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // CachedNetworkImage(
              //   imageUrl:
              //       'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/my_pic_01-jJWyP97XJwxkC0g7Z62XLCDMU68YE0.jpg',
              //   fit: BoxFit.cover,
              //   placeholder: (context, url) => const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              //   errorWidget: (context, url, error) => const Icon(Icons.image),
              // ),
              Container(
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL() async {
  final Uri url = Uri.parse('https://github.com/maurodev16/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Não foi possível abrir o link: $url';
  }
}
