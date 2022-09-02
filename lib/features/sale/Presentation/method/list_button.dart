import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Repository/sale_local_repository.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/bloc/sale_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/screens/sale_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Widget> listButton(TextStyle styleText, BuildContext context) {
  return [
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        primary: Colors.green
      ),
      child:  Text('Nueva Venta' , style: styleText,),
      onPressed: (){
        Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> const SaleRegisterScreen())
        );
      },
    ),
    const SizedBox(width: 10,),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        primary: Colors.redAccent
      ),
      child: Text('Nuevo Gasto' , style: styleText,),
      onPressed: (){
        // print('Opteniendo: ${SaleRepository().getSales()}');
      },
    ),
  ];
}