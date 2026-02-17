import 'package:hive/hive.dart';
part 'new_tour_expense_hive_model.g.dart';

@HiveType(typeId: 0)
class NewTourExpenseHiveModel extends HiveObject {
  @HiveField(0)
  String tourName;

  @HiveField(1)
  String tourDate;

  @HiveField(2)
  String tourRemark;

  @HiveField(3)
  String tourAmount;

  NewTourExpenseHiveModel({
    required this.tourName,
    required this.tourDate,
    required this.tourRemark,
    required this.tourAmount
  });
}
