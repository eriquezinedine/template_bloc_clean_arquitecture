import 'package:flutter/material.dart';
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
  static List<DropdownMenuItem<int>> listSelect = const [
    DropdownMenuItem(value: 0,child:  Text('Cliente'),),
    DropdownMenuItem(value: 1,child:  Text('Proveedor'),),
    DropdownMenuItem(value: 2 ,child:  Text('Vendedor'),),
  ];

}