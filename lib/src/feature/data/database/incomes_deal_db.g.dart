// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incomes_deal_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncomesDealDBAdapter extends TypeAdapter<IncomesDealDB> {
  @override
  final int typeId = 2;

  @override
  IncomesDealDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IncomesDealDB(
      amount: fields[0] as int,
      date: fields[1] as DateTime,
      incomeType: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IncomesDealDB obj) {
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
      other is IncomesDealDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
