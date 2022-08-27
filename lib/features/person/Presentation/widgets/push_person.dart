import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/widgets/appBarWidget.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/widgets/body.dart';
import 'package:flutter/material.dart';

class PushPerson extends StatelessWidget {
  const PushPerson({Key? key, this.person}) : super(key: key);
  final PersonModel? person;

  @override
  Widget build(BuildContext context) {

    TextEditingController personName = TextEditingController(
      text: person == null ? '': person!.name
    );
    TextEditingController personPhone = TextEditingController(
      text: person == null ? '': person!.celular

    );
    print(person);
    return Scaffold(
      appBar: appBarWidget(context),
      body: Body(personName: personName, personPhone: personPhone),
    );
  }
}

