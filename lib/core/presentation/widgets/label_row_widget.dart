import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:flutter/material.dart';

class LabelRowWidget extends StatelessWidget {
  const LabelRowWidget({super.key, required this.label, required this.content});
  final String label;
  final String content;
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black
    );
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Text(label, style: style ,),
          Text(content, style: style.copyWith(fontWeight: FontWeight.normal),)
        ],
      ),
    );
  }
}