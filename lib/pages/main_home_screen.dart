import 'package:flutter/material.dart';

import '../tab_manager.dart';
import '../widgets/background_gradient_overlay.dart';
import '../widgets/bottomnavbar.dart';
import 'chat_page.dart';
import 'place_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({
    super.key,
  });

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundGradientOverlay(
      child: ValueListenableBuilder(
        valueListenable: TabManager.selectedIndex,
        builder: (context, value, child) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: value == 3,
            backgroundColor: Colors.transparent,
            body: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Expanded(
                      child: ValueListenableBuilder<int>(
                          valueListenable: TabManager.selectedIndex,
                          builder: (context, value, child) {
                            if (value == 3) {
                              return ChatPage();
                            }
                            return PageView(
                              controller: controller,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                PlacePage(),
                                SearchPage(),
                                ProfilePage(),
                                // ChatPage(),
                              ],
                            );
                          }),
                    ),
                  ],
                )),
            bottomNavigationBar: Bottomnavbar(
              controller: controller,
            ),
          );
        },
      ),
    );
  }
}
