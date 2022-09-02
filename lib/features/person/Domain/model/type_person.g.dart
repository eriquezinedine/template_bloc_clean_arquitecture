// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypePersonAdapter extends TypeAdapter<TypePerson> {
  @override
  final int typeId = 1;

  @override
  TypePerson read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypePerson.cliente;
      case 1:
        return TypePerson.proveedor;
      case 2:
        return TypePerson.vendedor;
      default:
        return TypePerson.cliente;
    }
  }

  @override
  void write(BinaryWriter writer, TypePerson obj) {
    switch (obj) {
      case TypePerson.cliente:
        writer.writeByte(0);
        break;
      case TypePerson.proveedor:
        writer.writeByte(1);
        break;
      case TypePerson.vendedor:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypePersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
