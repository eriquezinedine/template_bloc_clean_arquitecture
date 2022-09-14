import 'package:clean_arquitecture_bloc_hive/core/utils/appbar.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/type_person.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';

class PersonSelectScreen extends StatelessWidget {
  const PersonSelectScreen({Key? key, required this.selectPerson, required this.isSale}) : super(key: key);
  final Function(PersonModel person) selectPerson;
  final bool isSale;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      appBar: appbar(title: isSale? 'Selecionar cliente o Trabajador': 'Selecionar Proveedor'),
      body: Container(
            margin: const EdgeInsets.only(
              top: 8
            ),
            // height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20
            ),
            decoration: const BoxDecoration(
              color: Color(0xffF5F6F8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50)
              )
            ),
            child: BlocBuilder<PersonBloc, PersonState>(
                  builder: (context, state) {
                    if(state is PersonLoadedState){
                      if(state.persons.isEmpty){
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              // Lottie.network('https://assets4.lottiefiles.com/private_files/lf30_e3pteeho.json'),
                              const Text('Vacio papu'),
                            ],
                          ),
                        );
                      }
                      return ListView(
                        shrinkWrap: false, //! Si pongo true pone el espacio predeterminado
                        children: [
                          ...state.persons
                          .map((e){
                            if (isSale) {
                              if (e.idType != TypePerson.proveedor) {
                                return ItemList(
                                      person: e,
                                      onTap: (){ 
                                        selectPerson(e);
                                        Navigator.pop(context);
                                      }
                                );
                            }
                            }else{
                              if (e.idType == TypePerson.proveedor) {
                                return ItemList(
                                      person: e,
                                      onTap: (){ 
                                        selectPerson(e);
                                        Navigator.pop(context);
                                      }
                                );
                            }

                            }
                            return const SizedBox();
                          }
                                ).toList()
                        ],
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
        )
    );
  }
}