// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_sale.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeSaleAdapter extends TypeAdapter<TypeSale> {
  @override
  final int typeId = 3;

  @override
  TypeSale read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypeSale.pagado;
      case 1:
        return TypeSale.deuda;
      default:
        return TypeSale.pagado;
    }
  }

  @override
  void write(BinaryWriter writer, TypeSale obj) {
    switch (obj) {
      case TypeSale.pagado:
        writer.writeByte(0);
        break;
      case TypeSale.deuda:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeSaleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
