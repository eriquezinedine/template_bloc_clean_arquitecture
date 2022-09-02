import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:clean_arquitecture_bloc_hive/features/home/domain/Repository/home_repository.dart';
import 'package:clean_arquitecture_bloc_hive/features/home/presentation/widgets/item_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Padding(
               padding: EdgeInsets.all(8.0),
               child: Text('Bienvenido',style: TextStyle(
                color: ThemeColor.textSecundary,
                fontWeight: FontWeight.bold,
                fontSize: 24
               ),),
             ),
             Container(
              padding: const EdgeInsets.only(
                left: 10
              ),
              width: double.infinity,
              height: 100,
              child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemCount: HomeRepository.listMenu.length,
               itemBuilder: (__, int index) {
                 return ItemMenu(
                  title: HomeRepository.listMenu[index].title,
                  onClick: (){
                    HomeRepository.listMenu[index].onClick(context);
                  },
                  icon: HomeRepository.listMenu[index].icon,
                );
               }, separatorBuilder: (__ , _)=> const SizedBox(width: 5),
             ),
             ),
           ],
         ),
      ),
    );
  }
}
