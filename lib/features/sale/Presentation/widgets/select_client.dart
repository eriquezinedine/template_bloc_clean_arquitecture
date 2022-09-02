import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/screens/person_select_screen.dart';
import 'package:flutter/material.dart';

class SelectClient extends StatefulWidget {
  const SelectClient({
    Key? key,
    this.personModel,
    required this.changePerson
  }) : super(key: key);
  final PersonModel? personModel;
  final Function(PersonModel person) changePerson;

  @override
  State<SelectClient> createState() => _SelectClientState();
}

class _SelectClientState extends State<SelectClient> {
  String defaultLabel = 'Selecionar un Cliente';
  late PersonModel selectPerson = PersonModel();

  @override
    void initState() {
      super.initState();
      if(widget.personModel != null){
        defaultLabel = widget.personModel!.name!;
      }
    }

  @override
  Widget build(BuildContext context) {

    void selectClient(PersonModel person){
       setState(() {
         selectPerson = person;
       });
       widget.changePerson(selectPerson);
    }
    return GestureDetector(
      onTap: () => {

        Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>  PersonSelectScreen(selectPerson: selectClient,))
        )
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(68, 50, 67, 86),
              offset: Offset(10.0, 9.0),
              blurRadius: 15.0,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Icon(Icons.supervised_user_circle ,color: ThemeColor.textSecundary,),
            const SizedBox(width: 10,),
            Text(selectPerson.name?? defaultLabel, style: const TextStyle(
              color: ThemeColor.textSecundary,
              fontWeight: FontWeight.w900
            ),)
          ],
        ),
      )
    );
  }
}


