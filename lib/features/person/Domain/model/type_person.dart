import 'package:hive/hive.dart';

part 'type_person.g.dart';

@HiveType(typeId: 1)
enum TypePerson {
  @HiveField(0)
  cliente,

  @HiveField(1)
  proveedor,

  @HiveField(2)
  vendedor,
}