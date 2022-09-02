import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/detail_sale_model.dart';
import 'package:flutter/material.dart';

class ItemDetailSaleDay extends StatelessWidget {
  const ItemDetailSaleDay({
    Key? key,
    required this.style,
    required this.detail,
  }) : super(key: key);
  final DetailSaleModel detail;
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
       onTap: ()=> {},
       shape: const RoundedRectangleBorder(
         borderRadius: BorderRadius.all(Radius.circular(20))
       ),
       leading: Container(
               padding: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: const Color(0xffFEF7E7)
               ),
             child: const Icon(Icons.attach_money_rounded, color: Color(0xffE6C991),),
             ),
       title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(detail.description,style: const TextStyle(
            fontSize: 14,
            color: ThemeColor.textSecundary
          )),
          Column(
            children: [
              Text('S/ ${detail.price * detail.count }',style:style.copyWith(color: Colors.green)),
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
       trailing: const Icon(Icons.more_vert_rounded,size: 29,)
      ),
    );
  }
}