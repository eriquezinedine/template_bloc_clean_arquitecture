import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {

  const DropdownWidget({Key? key, required this.changeSelect, required this.element, this.defaulValue}) : super(key: key);
  final Function({required int value}) changeSelect;
  final List<DropdownMenuItem<int>> element;
  final int? defaulValue;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}


class _DropdownWidgetState extends State<DropdownWidget> {
  int dropdownValue = 0;

  @override
  void initState() {
    super.initState();
    if(widget.defaulValue != null){
      setState(() {
        dropdownValue = widget.defaulValue!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:   [
           const Text('Seleccionar Tipo', style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
           const SizedBox(width: 10,),
          DropdownButton(
            value: dropdownValue,
            items: widget.element,
            onChanged: (int? value){
              setState(() {
                dropdownValue = value?? 0;
                print('hola');
                print(dropdownValue);
                widget.changeSelect(value: dropdownValue);
              });
            },
          )
        ],
      ),
    );
  }
}