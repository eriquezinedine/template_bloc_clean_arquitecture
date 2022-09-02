import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDay extends StatefulWidget {
  const SelectDay({
    Key? key,
    required this.changeDateTime
  }) : super(key: key);
  final Function(DateTime value) changeDateTime;

  @override
  State<SelectDay> createState() => _SelectDayState();
}

class _SelectDayState extends State<SelectDay> {

  late DateTime date;
  late String format;
  @override
  void initState() {
    date = DateTime.now();
    format = DateFormat('MMMM d').format(date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GestureDetector(
        onTap: () async {
          final resp = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(date.year-4),
            lastDate: DateTime(date.year+4)
          );
          if(resp != null){
            setState(() {});
            date =resp;
            format = DateFormat('MMMM d').format(date);
            widget.changeDateTime(resp);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.calendar_today_outlined, color: ThemeColor.textSecundary,),
              const SizedBox(width: 10,),
              Text(format, style: const TextStyle(
                color: ThemeColor.textSecundary,
                fontWeight: FontWeight.w900
              ),)
            ],
          ),
        ),
      )
    );
  }
}