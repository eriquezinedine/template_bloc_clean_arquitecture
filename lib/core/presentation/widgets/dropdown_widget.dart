import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/type_person.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {

  const DropdownWidget({Key? key, required this.changeSelect, required this.element, this.defaulValue}) : super(key: key);
  final Function({required TypePerson value}) changeSelect;
  final List<DropdownMenuItem<TypePerson>> element;
  final TypePerson? defaulValue;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}


class _DropdownWidgetState extends State<DropdownWidget> {
  TypePerson dropdownValue = TypePerson.cliente;

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
            onChanged: (TypePerson? value){
              setState(() {
                dropdownValue = value?? TypePerson.cliente;
                widget.changeSelect(value: dropdownValue);
              });
            },
          )
        ],
      ),
    );
  }
}