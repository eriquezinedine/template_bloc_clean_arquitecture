import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.person,
    required this.onTap,
  }) : super(key: key);

  final PersonModel person;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: const Icon(Icons.arrow_forward_ios_sharp,color: Color.fromARGB(184, 96, 125, 139),),
        onTap: onTap,
        leading: CircleAvatar(
          radius: 20,
          child: Text(person.name!.substring(0,1)),
        ),
        title: Text(person.name!),
        subtitle: Text(person.celular!),
      );
  }
}