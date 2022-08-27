import 'package:hive/hive.dart';

part 'person_model.g.dart';

enum TypePerson{
  vendedor,
  proveedor,
  cliente
}

@HiveType(typeId: 0)
class PersonModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? celular;
  
  @HiveField(2)
  int? idType;
  
  PersonModel({this.name, this.celular, this.idType});
  // Hive fields go here
}