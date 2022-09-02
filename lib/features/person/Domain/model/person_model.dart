import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/type_person.dart';

part 'person_model.g.dart';


@HiveType(typeId: 0)
class PersonModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? celular;
  
  @HiveField(2)
  TypePerson? idType;
  
  PersonModel({this.name, this.celular, this.idType});
  // Hive fields go here
  static List<DropdownMenuItem<TypePerson>> listSelect = const [
    DropdownMenuItem(value: TypePerson.cliente ,child:  Text('Cliente'),),
    DropdownMenuItem(value: TypePerson.proveedor,child:  Text('Proveedor'),),
    DropdownMenuItem(value: TypePerson.vendedor ,child:  Text('Vendedor'),),
  ];

}