import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:flutter/material.dart';

class IconDebt extends StatelessWidget {
  const IconDebt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeColor.orangeSecundary
      ),
    child: const Icon(
      Icons.attach_money_rounded,
      color: ThemeColor.orangePrimary
      ),
    );
  }
}