import 'package:flexibiz/local_database/hive_database_utils/hive_database_name.dart';
import 'package:flexibiz/local_database/hive_model/new_tour_expense_hive_model/new_tour_expense_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveServiceInit {
  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    //-----------Register Adapters -----------------------------------

    Hive.registerAdapter(NewTourExpenseHiveModelAdapter());

    //-----------Open Boxes ------------------------------------------

    await Hive.openBox<NewTourExpenseHiveModel>(HiveDatabaseName.newTourExpenseDB);

  }
}