import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/detail_sale_model.dart';
import 'package:flutter/material.dart';

class IconSale extends StatelessWidget {
  const IconSale({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final DetailSaleModel detail;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: detail.price <0 
                     ? ThemeColor.redSecundary
                     : ThemeColor.greenSecundary
            ),
          child: Icon(
           Icons.attach_money_rounded,
           color: detail.price <0 
                 ? ThemeColor.redPrimary
                 :ThemeColor.greenPrimary,
           ),
          );
  }
}