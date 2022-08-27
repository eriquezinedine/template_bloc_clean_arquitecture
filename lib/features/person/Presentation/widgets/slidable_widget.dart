import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/widgets/push_person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../Domain/model/person_model.dart';

class SlidableWidget extends StatelessWidget {
  const SlidableWidget({
    Key? key,
    required this.person
  }) : super(key: key);

  final PersonModel person;

  @override
  Widget build(BuildContext context) {
    final personBloc = BlocProvider.of<PersonBloc>(context);
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {
        //   personBloc.add(DeletePersonEvent(person: person));
        // }),
        children:  [
          SlidableAction(
            onPressed: (va)=>personBloc.add(DeletePersonEvent(person: person)),
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
          trailing: const Icon(Icons.delete, color: Colors.redAccent,),
          onTap: (){
            Navigator.push(context, 
              MaterialPageRoute(builder: (context)=> PushPerson(person: person,))
            );
          },
          leading: CircleAvatar(
            radius: 20,
            child: Text(person.name!.substring(0,2)),
          ),
          title: Text(person.name!),
          subtitle: Text(person.celular!),
        ),
    );
  }
}