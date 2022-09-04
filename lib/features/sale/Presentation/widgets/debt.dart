import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:flutter/material.dart';


class TextDebt extends StatelessWidget {
  const TextDebt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Deuda!',
      style: TextStyle(
        color: ThemeColor.orangePrimary,
        fontSize: 12
      ),
    );
  }
}