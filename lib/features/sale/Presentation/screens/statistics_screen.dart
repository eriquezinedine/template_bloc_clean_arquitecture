import 'package:clean_arquitecture_bloc_hive/core/presentation/widgets/page_widget.dart';
import 'package:clean_arquitecture_bloc_hive/core/utils/appbar.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
   
  const StatisticsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      appbar: appbar(title: 'Estadisticas'),
      body: const Center(
        child: Text('Selecionar una fecha'),
      )
    );
  }
}