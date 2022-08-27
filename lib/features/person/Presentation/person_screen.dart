import 'package:clean_arquitecture_bloc_hive/features/person/Domain/services/person_service.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/widgets/push_person.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/widgets/slidable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PersonScreen extends StatelessWidget {
   
  const PersonScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Personas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/3,
                      child: ElevatedButton(
                        child: const Text('Agregar'),
                        onPressed: (){
                          Navigator.of(context).pushNamed('person');
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    ChoiceChip(label: Text('Trabajador'), selected: true),
                    SizedBox(width: 5,),
                    ChoiceChip(label: Text('Vendedor'), selected: false),
                    SizedBox(width: 5,),
                    ChoiceChip(label: Text('Proveedor'), selected: false),
                    SizedBox(width: 5,),
                  ],
                ),
                const SizedBox(height: 20,),
                BlocProvider(
                  create: (context) => PersonBloc(RepositoryProvider.of<PersonService>(context))
                  ..add(const LoadPersonEvent()),
                  child: BlocBuilder<PersonBloc, PersonState>(
                    builder: (context, state) {
                      if(state is PersonLoadedState){
                        if(state.persons.isEmpty){
                          return const Text('Vacio papu');
                        }
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            ...state.persons
                            .map((e) => SlidableWidget(person: e,)).toList()
                          ],
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

