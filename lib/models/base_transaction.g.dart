// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseTransactionAdapter extends TypeAdapter<BaseTransaction> {
  @override
  final int typeId = 1;

  @override
  BaseTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseTransaction(
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BaseTransaction obj) {
    writer
      ..writeByte(4)
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
      other is BaseTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
