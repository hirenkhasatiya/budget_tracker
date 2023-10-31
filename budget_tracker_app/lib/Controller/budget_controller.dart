import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class budgetController extends GetxController {
  RxInt selectedIndex = 0.obs;

  PageController pageController = PageController();

  changeIndex({required int index}) {
    selectedIndex(index);
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 600), curve: Curves.linear);
  }
}
