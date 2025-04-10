import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/tip_card_model.dart';

class FlutterTipsSection extends StatefulWidget {
  const FlutterTipsSection({Key? key}) : super(key: key);

  @override
  State<FlutterTipsSection> createState() => _FlutterTipsSectionState();
}

class _FlutterTipsSectionState extends State<FlutterTipsSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<TipCard> _tips = [
    TipCard(
      title: 'Publishing Flutter apps on Google Play - Debug Symbols',
      author: 'Mauro Rodrigues',
      date: 'Feb 15, 2024',
      content:
          'If you are trying to publish your Flutter app on Google Play and receiving this alert:\n\n'
          '"This App Bundle contains native code and you haven\'t uploaded debug symbols. '
          'We recommend that you upload a symbol file to make your crashes and ANRs easier to analyze and debug."\n\n'
          'Here\'s the solution:\n\n'
          '1️⃣ In `app/build.gradle`, try adding:\n'
          '```gradle\n'
          'android.buildTypes.release.ndk.debugSymbolLevel = "FULL"\n'
          '```\n'
          'Note: This solution is not compatible with Flutter 2.10.\n\n'
          '2️⃣ Alternatively, upload the files manually:\n'
          '📂 Go to `[your project]/build/app/intermediates/merged_native_libs/release/out/lib`.\n'
          '📂 Select the folders `arm64-v8a`, `armeabi-v7a`, `x86_64` and compress them into a `.zip` file.\n'
          '📤 Upload this `.zip` to the Google Play Console as a debug symbol file.\n\n'
          '🔍 This way, you improve crash and ANR analysis for your app in the Play Store.',
      icon: Icons.bug_report,
      iconColor: Colors.orangeAccent,
    ),
    TipCard(
      title: 'Optimizing list performance in Flutter',
      author: 'You',
      date: 'Mar 20, 2024',
      content:
          'To improve the performance of large lists in Flutter, consider these tips:\n\n'
          '1️⃣ Use ListView.builder instead of conventional ListView for on-demand rendering.\n\n'
          '2️⃣ Implement const constructor in child widgets to avoid unnecessary rebuilds.\n\n'
          '3️⃣ Use ListView.separated for efficient separators between items.\n\n'
          '4️⃣ Consider using IndexedStack to maintain the state of off-screen screens.\n\n'
          '5️⃣ Implement pagination to load data gradually instead of all at once.\n\n'
          '6️⃣ Use cacheExtent to pre-load items outside the viewport.\n\n'
          'These practices can significantly improve performance and user experience in apps with extensive lists.',
      icon: Icons.speed,
      iconColor: Colors.greenAccent,
    ),
    TipCard(
      title: 'Efficient state management with GetX',
      author: 'You',
      date: 'Apr 5, 2024',
      content:
          'GetX is a powerful solution for state management in Flutter. Here are some tips:\n\n'
          '1️⃣ Use Rx<Type> to create observable variables:\n'
          '```dart\n'
          'final name = "".obs;\n'
          'final count = 0.obs;\n'
          'final isLogged = false.obs;\n'
          'final user = User().obs;\n'
          '```\n\n'
          '2️⃣ To update objects, use the update() syntax:\n'
          '```dart\n'
          'final user = User().obs;\n'
          'user.update((val) {\n'
          '  val.name = "John";\n'
          '  val.age = 30;\n'
          '});\n'
          '```\n\n'
          '3️⃣ Use GetBuilder for manually controlled updates:\n'
          '```dart\n'
          'GetBuilder<Controller>(\n'
          '  init: Controller(),\n'
          '  builder: (controller) => Text(controller.value),\n'
          ');\n'
          '```\n\n'
          '4️⃣ For navigation, use Get.to(), Get.off() and Get.offAll() for a cleaner API.\n\n'
          'GetX offers cleaner and more efficient code for state management in Flutter applications.',
      icon: Icons.sync,
      iconColor: Colors.blueAccent,
    ),
  ];

  int _currentTipIndex = 0;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tips.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTipIndex = _tabController.index;
        _isExpanded = false;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 30, vertical: isMobile ? 30 : 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF5E4C4C),
            const Color(0xFF3E2723),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Título da seção
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.tips_and_updates,
                color: Colors.amberAccent,
                size: isMobile ? 24 : 32,
              ),
              SizedBox(width: 12),
              Text(
                'Flutter Tips',
                style: GoogleFonts.playfairDisplay(
                  fontSize: isMobile ? 26 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Abas de navegação
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withValues(alpha: 0.1),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: isMobile ? 12 : 14,
              ),
              tabs: List.generate(
                _tips.length,
                (index) => Tab(
                  icon: Icon(_tips[index].icon, color: _tips[index].iconColor),
                  text: isMobile ? null : 'Tip ${index + 1}',
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Conteúdo do card
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cabeçalho do tip
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: _tips[_currentTipIndex]
                            .iconColor
                            .withValues(alpha: 0.2),
                        child: Icon(
                          _tips[_currentTipIndex].icon,
                          color: _tips[_currentTipIndex].iconColor,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _tips[_currentTipIndex].title,
                              style: GoogleFonts.poppins(
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Por ${_tips[_currentTipIndex].author} • ${_tips[_currentTipIndex].date}',
                              style: GoogleFonts.poppins(
                                fontSize: isMobile ? 12 : 14,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Conteúdo do tip
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _tips[_currentTipIndex].content,
                            style: GoogleFonts.roboto(
                              fontSize: isMobile ? 14 : 16,
                              color: Colors.white.withValues(alpha: 0.9),
                              height: 1.6,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Botões de ação
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.copy,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          // Aqui você implementaria a funcionalidade de cópia
                          // Geralmente usando: Clipboard.setData(ClipboardData(text: _tips[_currentTipIndex].content));
                          // E mostrando um snackbar: Get.snackbar('Copiado', 'Dica copiada para a área de transferência');
                        },
                        tooltip: 'Copiar dica',
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          // Implementar compartilhamento
                        },
                        tooltip: 'Compartilhar',
                      ),
                      IconButton(
                        icon: Icon(
                          _isExpanded
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                          // Em um app real, você expandiria para tela cheia ou modalidade de leitura
                        },
                        tooltip: _isExpanded ? 'Minimizar' : 'Expandir',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Paginação na parte inferior
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _tips.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentTipIndex == index ? 20 : 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: _currentTipIndex == index
                      ? _tips[index].iconColor
                      : Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Call-to-action to add a tip
          TextButton.icon(
            onPressed: () {
              // Implement functionality to add a new tip
            },
            icon: Icon(Icons.add_circle_outline, color: Colors.white70),
            label: Text(
              'Contribute with a tip',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              backgroundColor: Colors.white.withValues(alpha: 0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
