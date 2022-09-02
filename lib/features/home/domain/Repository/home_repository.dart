import 'package:clean_arquitecture_bloc_hive/features/home/domain/model/menu.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/screens/person_screen.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/screens/sale_screens.dart';
import 'package:flutter/material.dart';

class HomeRepository{
  static List<Menu> listMenu = [
    Menu('Personas', Icons.supervised_user_circle_rounded, (BuildContext context){
      Navigator.push(context, 
        MaterialPageRoute(builder: (context)=> const PersonScreen())
      );
    }),
    Menu('Ventas', Icons.shopping_bag_outlined, (BuildContext context){
      Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> const SaleScreen())
        );
    }),
  ];
}