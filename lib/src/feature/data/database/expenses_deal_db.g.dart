// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_deal_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensesDealDBAdapter extends TypeAdapter<ExpensesDealDB> {
  @override
  final int typeId = 1;

  @override
  ExpensesDealDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpensesDealDB(
      amount: fields[0] as int,
      date: fields[1] as DateTime,
      incomeType: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExpensesDealDB obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.incomeType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensesDealDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
