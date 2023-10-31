import 'package:budget_tracker_app/Controller/budget_controller.dart';
import 'package:budget_tracker_app/Utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  budgetController controller = Get.put(budgetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Tracker"),
        centerTitle: true,
        backgroundColor: c1,
        foregroundColor: c4,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.trending_up),
          )
        ],
      ),
      backgroundColor: c4,
      drawer: Drawer(
        backgroundColor: c4,
      ),
      body: PageView(
        onPageChanged: (value) => controller.changeIndex(index: value),
        controller: controller.pageController,
        children: [
          Icon(Icons.home_filled),
          Icon(Icons.category_rounded),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: c1,
        foregroundColor: c4,
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          backgroundColor: c4,
          indicatorColor: c3,
          surfaceTintColor: c4,
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(milliseconds: 600),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (value) =>
              controller.changeIndex(index: value),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home, color: c1),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.category_rounded, color: c1),
              label: "Category",
            ),
            NavigationDestination(
              icon: Icon(Icons.home, color: c1),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.category_rounded, color: c1),
              label: "Category",
            ),
          ],
        );
      }),
    );
  }
}
