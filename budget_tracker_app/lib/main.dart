import 'package:budget_tracker_app/Helpers/budget_helper.dart';
import 'package:budget_tracker_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BudgetHelper.budgetHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
      ],
    );
  }
}
