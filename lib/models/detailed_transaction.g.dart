// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailedTransactionAdapter extends TypeAdapter<DetailedTransaction> {
  @override
  final int typeId = 2;

  @override
  DetailedTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailedTransaction(
      id: fields[3] as int,
    )..commission = fields[5] as double;
  }

  @override
  void write(BinaryWriter writer, DetailedTransaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.commission)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.transactionNumber)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailedTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
