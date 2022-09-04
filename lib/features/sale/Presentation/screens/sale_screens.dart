import 'package:clean_arquitecture_bloc_hive/core/utils/appbar.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/bloc/sale_bloc.dart';
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listButton(styleText,context),
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
        child: BlocBuilder<SaleBloc, SaleState>(
                  builder: (context, state) {
                    if(state is SaleLoadedState){
                      if(state.sales.isEmpty){
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
                        children: [
                          DetailDay(
                            total: state.getTotal[0],
                            sale: state.getTotal[1],
                            spent: state.getTotal[2],
                          ),
                          ...state.sales
                          .map((e){
                            //! Cuantos elementos llegan
                            // print('zinedine ${e.detail}');
                            return ItemListDay(sale: e,);
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