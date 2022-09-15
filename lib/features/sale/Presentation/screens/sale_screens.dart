import 'package:clean_arquitecture_bloc_hive/core/utils/appbar.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/bloc/bloc_day/day_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/method/list_button.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/detail_day.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/item_list_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaleScreen extends StatelessWidget {
   
  const SaleScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    const styleText = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold
    );
    return  Scaffold(
      floatingActionButton: Container(
        width: double.infinity,
        // color: Colors.red, //!problema
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listButton(styleText,context),
        ),
      ),
      appBar: appbar( title: 'Renee Viviana Torres' ),
      backgroundColor: Colors.teal,
      body:  Container(
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
        child: BlocBuilder<DayBloc, DayState>(
                  builder: (context, state) {
                    if(state is DayLoadedState){
                      if(state.days.isEmpty){
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  const [
                              Text('Esta vacio Agrega una nueva venta'),
                            ],
                          ),
                        );
                      }
                      return ListView(
                        shrinkWrap: false, //! Si pongo true pone el espacio predeterminado
                        children:  [
                           const DetailDay(),
                          ...state.days
                          .map((e){
                            //! en listo los dias que se registraron
                            // print('zinedine ${e.detail}');
                            return ItemListDay(day: e,);
                          }).toList(),
                          const SizedBox(height: 90,)
                        ],
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
        // child: ListView(
        //   shrinkWrap: false,
        //   children: const [
        //     DetailDay(),
        //     SizedBox(height: 5,),
        //     // Spacer(),
        //     ItemListDay(),
        //     SizedBox(height: 20,),
        //     // ItemListDay(),
        //     SizedBox(height: 70,),
        //   ],
        // ),
      ),
    );
  }

}