import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/item_detail_sale_day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemListDay extends StatelessWidget {
  const ItemListDay({super.key, required this.sale});
  final SaleModel sale;
  @override
  Widget build(BuildContext context) {
    bool isOpen = false;
    final format = DateFormat('MMMM d').format(sale.date);
    const TextStyle style = TextStyle(
      color: ThemeColor.textSecundary,
      fontWeight: FontWeight.w900,
      fontSize: 18
    );
    
    return StatefulBuilder(
      builder: (context, refresh) {
        return Column(
          children: [
            GestureDetector(
              onTap: () => {
                refresh(() => isOpen = !isOpen,)
              },
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 5
                ),
                decoration: BoxDecoration(
                  color: isOpen? const Color.fromARGB(130, 179, 180, 181): Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(format,style: style,),
                    Text('S/ ${sale.getTotal}',style: style,),
                  ],
                ),
              ),
            ),
              ...sale.detail.map((e){
              if(isOpen){
                return ItemDetailSaleDay(style: style,detail: e, date: sale.date,);
              }
              return const SizedBox();
            }).toList(),
          ],
        );
      }
    );
  }
}

