import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/screens/sale_register_screen.dart';
import 'package:flutter/material.dart';

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
          MaterialPageRoute(builder: (context)=> const SaleRegisterScreen( isSale: true,))
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
        Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> const SaleRegisterScreen( isSale: false,))
        );
      },
    ),
  ];
}