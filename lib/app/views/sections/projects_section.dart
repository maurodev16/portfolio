import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Project {
  final String title;
  final String subtitle;
  final List<String> imageUrls;
  final String description;

  Project({
    required this.title,
    required this.subtitle,
    required this.imageUrls,
    required this.description,
  });
}

class ProjectsSection extends StatelessWidget {
  ProjectsSection({Key? key}) : super(key: key);

  final List<Project> projects = [
    Project(
      title: 'DMSA Positionsanzeige für Messschieber App',
      subtitle: 'DMSA für Messschieber App',
      description: 'Descrição detalhada do projeto...',
      imageUrls: [
        'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/dmsa_01-R9nxXC3XtknIYEaHKTQRVtjOOaLMqN.jpg',
        'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/dmsa_02-wyNyoFPGpfcpGNUuKxMzFD89SKhl8G.jpg',
        'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/dmsa_03-oZBlhTXZ1rqt21HwDdAPjracombLwH.jpg',
      ],
    ),
    Project(
      title: 'Terapia App',
      subtitle: 'Aplicativo de Terapia',
      description: 'Descrição detalhada do projeto...',
      imageUrls: [
        'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/terap_01-V9sOkUfg5Y1L7j1tUDkUmbNEfKW26I.jpg',
        'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/terap_02-8OfhvbZUuAc6jeCK0C2suX3BTewyTp.jpg',
      ],
    ),
    Project(
      title: 'Was Geht Ab',
      subtitle: 'Event Finder App',
      description: 'Descrição detalhada do projeto...',
      imageUrls: [
        'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/was_geht_ab_01-QcccVAzn9LHSxiwXGlU0LFidEWw1pE.jpg',
        'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/was_geht_ab_02-0n47gNTG7o4yfL71c1vocIulY2fx6Y.jpg',
        'https://g5vqujw8iglfdivd.public.blob.vercel-storage.com/portfolio_web/was_geht_ab_03-pUnh5TLUEjRAUuWePzuEiSaKZzBmpD.jpg',
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // Detecta se está em modo mobile
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: Get.height,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 20,
      ),
      color: const Color.fromARGB(255, 30, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Projetos',
            style: GoogleFonts.playfair(
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.2 : 0.85,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return _buildProjectCard(context, projects[index], isMobile);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
      BuildContext context, Project project, bool isMobile) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showProjectDetails(context, project, isMobile),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black..withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: project.imageUrls.first,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[800],
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[700],
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black..withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(isMobile ? 20 : 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.title,
                          style: GoogleFonts.lato(
                            fontSize: isMobile ? 24 : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          project.subtitle,
                          style: GoogleFonts.lato(
                            fontSize: isMobile ? 16 : 14,
                            color: Colors.white70,
                          ),
                        ),
                        if (project.imageUrls.length > 1)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.photo_library,
                                  color: Colors.white70,
                                  size: isMobile ? 18 : 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${project.imageUrls.length} fotos',
                                  style: GoogleFonts.lato(
                                    fontSize: isMobile ? 14 : 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showProjectDetails(
      BuildContext context, Project project, bool isMobile) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: isMobile ? Get.width * 0.95 : Get.width * 0.8,
          height: isMobile ? Get.height * 0.9 : Get.height * 0.8,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 30, 30, 30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(isMobile ? 12 : 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        project.title,
                        style: GoogleFonts.playfair(
                          fontSize: isMobile ? 20 : 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: isMobile ? Get.height * 0.5 : Get.height * 0.6,
                    viewportFraction: isMobile ? 0.9 : 0.8,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                  items: project.imageUrls.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: isMobile ? Get.width * 0.8 : Get.width * 0.7,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.contain,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(isMobile ? 12 : 16),
                child: Text(
                  project.description,
                  style: GoogleFonts.lato(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
