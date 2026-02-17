// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_tour_expense_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewTourExpenseHiveModelAdapter
    extends TypeAdapter<NewTourExpenseHiveModel> {
  @override
  final int typeId = 0;

  @override
  NewTourExpenseHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewTourExpenseHiveModel(
      tourName: fields[0] as String,
      tourDate: fields[1] as String,
      tourRemark: fields[2] as String,
      tourAmount: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewTourExpenseHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tourName)
      ..writeByte(1)
      ..write(obj.tourDate)
      ..writeByte(2)
      ..write(obj.tourRemark)
      ..writeByte(3)
      ..write(obj.tourAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewTourExpenseHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
