import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/sale/sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/type/type_sale.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/screens/detail_sreen.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/debt.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/icon_debt.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/icon_sale.dart';
import 'package:flutter/material.dart';

class ItemDetailSaleDay extends StatelessWidget {
  const ItemDetailSaleDay({
    Key? key,
    required this.style,
    required this.detail,
    required this.date
  }) : super(key: key);
  final SaleModel detail;
  final DateTime date;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 5
      ),
      decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: ListTile(
       onTap: ()=> {
        //*Podre ver el detalle
          // Navigator.push(context, 
          //   MaterialPageRoute(
          //     builder: (context)=> DetailScreen(
          //       date: date,
          //       detail: detail,
          //     )
          //   )
          // )
        //  if(TypeSale.deuda == detail.typeSale){
        //     //!SE LISTA LA DEUDA DE UNA PERSONA
        //     // Navigator.push(context, 
        //     //   MaterialPageRoute(builder: (context)=> DebtScreen(detail: detail,))
        //     // )
        //  }else{
            
        //  }
       },
       trailing: const Icon(Icons.more_vert_rounded,size: 29,),
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(20))
       ),
       leading: detail.typeSale == TypeSale.deuda
                ? const IconDebt()
                : IconSale(detail: detail),
       title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(detail.description,style: const TextStyle(
                fontSize: 14,
                color: ThemeColor.textSecundary
              )),
              const SizedBox(width: 8,),
              detail.typeSale == TypeSale.deuda
              ? const TextDebt()
              : const SizedBox()
            ],
          ),
          Column(
            children: [
              Text(
                'S/ ${detail.price * detail.count }'.replaceAll('-', ''),
                style:style.copyWith(
                  color: detail.price <0? Colors.redAccent: Colors.green
                )
              ),
              Text('efectivo',style:style.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(181, 50, 67, 86)
                )
              ),
            ],
          )
        ],
       ),
      ),
    );
  }
}

