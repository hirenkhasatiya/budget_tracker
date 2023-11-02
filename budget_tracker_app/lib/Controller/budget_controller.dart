import 'package:budget_tracker_app/views/components/categiry_component.dart';
import 'package:budget_tracker_app/views/components/home_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class budgetController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxList<Widget> page = <Widget>[
    HomeComponent(),
    CategoryComponent(),
  ].obs;

  PageController pageController = PageController();

  changeIndex({required int index}) {
    selectedIndex(index);
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 600), curve: Curves.linear);
  }
}
