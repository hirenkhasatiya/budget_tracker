import 'package:budget_tracker_app/Modals/budget_modal.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BudgetHelper {
  BudgetHelper._() {
    init();
  }

  static final BudgetHelper budgetHelper = BudgetHelper._();

  late Database database;
  Logger logger = Logger();

  String budgetTable = 'budgetData';
  String colId = 'id';
  String colname = 'name';

  init() async {
    String budgetPath = await getDatabasesPath();

    String path = join(budgetPath, 'budgetData.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE $budgetTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colname TEXT NOT NULL)";

        db
            .execute(query)
            .then(
              (value) => logger.i("Table Created !!!"),
            )
            .onError(
              (error, stackTrace) => logger.e("ERROR : $error"),
            );
      },
      onUpgrade: (db, oldVersion, newVersion) => {},
    );
  }

  Future<List<Budget>> getbudget() async {
    String query = "SELECT * FROM $budgetTable";

    List<Map> alldata = await database.rawQuery(query);

    List<Budget> allBudget =
        alldata.map((e) => Budget.fromMap(data: e)).toList();

    return allBudget;
  }

  Future<int> insertBudget({required Budget budget}) {
    return database.insert(budgetTable, budget.toMap);
  }
}
