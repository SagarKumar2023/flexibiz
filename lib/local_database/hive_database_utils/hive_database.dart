import 'package:flexibiz/local_database/hive_database_utils/hive_database_name.dart';
import 'package:flexibiz/local_database/hive_model/new_tour_expense_hive_model/new_tour_expense_hive_model.dart';
import 'package:hive/hive.dart';

class HiveDatabase{
 static Box<NewTourExpenseHiveModel> newTourExpenseDB() =>Hive.box<NewTourExpenseHiveModel>(HiveDatabaseName.newTourExpenseDB);
}