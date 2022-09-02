// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_sale_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailSaleModelAdapter extends TypeAdapter<DetailSaleModel> {
  @override
  final int typeId = 2;

  @override
  DetailSaleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailSaleModel(
      id: fields[0] as int,
      description: fields[1] as String,
      count: fields[2] as double,
      price: fields[3] as double,
      person: fields[4] as PersonModel,
      typeSale: fields[6] as TypeSale,
    );
  }

  @override
  void write(BinaryWriter writer, DetailSaleModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.person)
      ..writeByte(6)
      ..write(obj.typeSale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailSaleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
