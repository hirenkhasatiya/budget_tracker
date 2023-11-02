import 'dart:developer';

import 'package:budget_tracker_app/Helpers/budget_helper.dart';
import 'package:budget_tracker_app/Modals/budget_modal.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  RxList<Budget> allBudget = <Budget>[].obs;

  DbController() {
    init();
  }

  init() async {
    allBudget(await BudgetHelper.budgetHelper.getbudget());
  }

  insert({required Budget budget}) async {
    int data = await (BudgetHelper.budgetHelper.insertBudget(budget: budget)
      ..then((value) => init()));
    log("DATA : $data");
  }
}
