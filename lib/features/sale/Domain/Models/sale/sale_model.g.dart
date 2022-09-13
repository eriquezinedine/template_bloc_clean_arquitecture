// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleModelAdapter extends TypeAdapter<SaleModel> {
  @override
  final int typeId = 2;

  @override
  SaleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleModel(
      idSale: fields[0] as int,
      idDay: fields[1] as int,
      description: fields[2] as String,
      count: fields[3] as double,
      price: fields[4] as double,
      person: fields[5] as PersonModel,
      typeSale: fields[6] as TypeSale,
    );
  }

  @override
  void write(BinaryWriter writer, SaleModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.idSale)
      ..writeByte(1)
      ..write(obj.idDay)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.person)
      ..writeByte(6)
      ..write(obj.typeSale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
