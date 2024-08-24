import 'package:flutter/material.dart';

class TabManager with ChangeNotifier {

  static ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  static void changeTab(int index) {
    print("Change tab: $index");
    // controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    selectedIndex.value = index;
  }
}
