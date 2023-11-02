import 'package:budget_tracker_app/Controller/DBController.dart';
import 'package:budget_tracker_app/Controller/budget_controller.dart';
import 'package:budget_tracker_app/Modals/budget_modal.dart';
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
            icon: const Icon(Icons.trending_up),
          )
        ],
      ),
      backgroundColor: c4,
      drawer: Drawer(
        backgroundColor: c4,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: c1,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: c1),
                accountName: const Text(
                  "Hiren Khasatiya",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: const Text("khasatiyahiren43@gmail.com"),
                currentAccountPictureSize: const Size.square(40),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: c4,
                  child: Text(
                    "H",
                    style: TextStyle(fontSize: 30.0, color: c1),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.trending_up_outlined),
              title: const Text(' My Budget '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: const Text('Theme'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: PageView(
        onPageChanged: (value) => controller.changeIndex(index: value),
        controller: controller.pageController,
        children: controller.page,
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: c1,
        foregroundColor: c4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.add),
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
          animationDuration: const Duration(milliseconds: 600),
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
          ],
        );
      }),
    );
  }
}
