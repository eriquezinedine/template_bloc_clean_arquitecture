import 'package:clean_arquitecture_bloc_hive/core/presentation/widgets/page_widget.dart';
import 'package:clean_arquitecture_bloc_hive/core/utils/appbar.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/widgets/item_list.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/bloc/bloc_sale/sale_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/screens/debt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpentScreen extends StatelessWidget {
   
  const SpentScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  PageWidget(
      appbar: appbar(title: 'Personas en Gastos'),
      body: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, statePerson) {
          if(statePerson is PersonLoadedState){
            return BlocBuilder<SaleBloc, SaleState>(
              builder: (context, stateSale){
                if (stateSale is SaleLoadedState) {
                  return ListView(
                    shrinkWrap: false,
                    children:   [
                      const SizedBox(height: 10,),
                      ...statePerson.persons
                      .map((e){
                        bool isSpent = stateSale.searchPerson(e);
                        if(isSpent){
                          return ItemList(person: e, onTap: (){
                            Navigator.push(context, 
                              MaterialPageRoute(builder: (context)=> DebtScreen(person: e))
                            );
                            print('Selecionando persona');
                          });
                        }
                        return const SizedBox();
                      }).toList()
                      // ...statePerson.persons //* Map dentro de otro MaP
                      // .map((p){
                      //   //! Cuantos elementos llegan
                      //   // print('zinedine ${e.detail}');
                      //   return Column(
                      //     children: [
                      //       ...p.detail.map((e) => detail.person.name == e.person.name? ItemDebt(detail: e, date:  p.date,): const SizedBox())
                      //     ],
                      //   );
                      // }).toList(),
                      
                    ],
                  );
                }
                return const CircularProgressIndicator();
              }
            );
          }
          return const CircularProgressIndicator();
        }
      )
    );
  }
}