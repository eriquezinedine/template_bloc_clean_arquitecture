
import 'package:clean_arquitecture_bloc_hive/core/presentation/widgets/page_widget.dart';
import 'package:clean_arquitecture_bloc_hive/core/utils/appbar.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/sale/sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/type/type_sale.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/bloc/bloc_sale/sale_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/screens/detail_sreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DebtScreen extends StatelessWidget {
   
  const DebtScreen({Key? key, required this.person}) : super(key: key);
  final PersonModel person;
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      appbar: appbar(title: person.name),
      body: BlocBuilder<SaleBloc, SaleState>(
        builder: (context, state) {
          if(state is SaleLoadedState){
            return ListView(
            shrinkWrap: false,
            children:   [
               const Text(
                'Lista de deudas',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
               const SizedBox(height: 10,),
              ...state.sales
              .map((p){
                //! Cuantos elementos llegan
                return person.name == p.person.name && p.typeSale == TypeSale.deuda? ItemDebt(detail: p, date:  DateTime.now(),): const SizedBox();
              }).toList(),
              
            ],
          );
          }
          return const CircularProgressIndicator();
        }
      )
    );
  }
}

class ItemDebt extends StatelessWidget {
  const ItemDebt({
    Key? key,
    required this.detail,
    required this.date
  }) : super(key: key);
  final SaleModel detail;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: ListTile(
        onTap: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> DetailScreen(date: date, detail: detail,))
        );
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(detail.description),
            Text('S ${detail.price * detail.count}'.replaceAll('-', '')),
          ],
        ),
        subtitle: Text(DateFormat('MMMM d').format(date)),
        trailing: const Icon(Icons.more_vert_rounded,size: 29,),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }
}