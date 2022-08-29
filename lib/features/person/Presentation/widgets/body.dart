import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/dropdown_widget.dart';
import '../../../../core/presentation/widgets/input_widget.dart';


class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.personName,
    required this.personPhone,
    this.person,
    required this.personBloc
  }) : super(key: key);

  final TextEditingController personName;
  final TextEditingController personPhone;
  final PersonModel? person;
  final PersonBloc personBloc;
   

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 20,
        left: 20,
        right: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            person == null?'Registrar Persona':'Actualizar Datos',
            style:  const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputWidget(
            controller: personName,
            icon: Icons.person,
            label: 'Nombre',
            placeholder: 'Ingresar Nombre',
          ),
          const DropdownWidget(),
          InputWidget(
            controller: personPhone,
            icon: Icons.phone_android_outlined,
            label: 'Celular',
            placeholder: 'Numero de Celular',
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10)
            ),
            onPressed: (){
              if(person == null){
                personBloc.add(AddPersonEvent(person: PersonModel(name: personName.text, celular: personPhone.text, idType: 0)));
              }else{
                personBloc.add(
                  UpdatePersonEvent(
                    person: person!,
                    editPerson: PersonModel(
                      idType: 0,
                      celular: personPhone.text,
                      name: personName.text
                    )
                  )
                );
              }
              // personBloc.close(); //!Dice el error que no se puede cerrar
              Navigator.pop(context);
            },
            child:  Text(
              person == null? 'Registrar':'Actualizar',
               style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
               ),
            )
          )
        ],
      ),
    );
  }
}

