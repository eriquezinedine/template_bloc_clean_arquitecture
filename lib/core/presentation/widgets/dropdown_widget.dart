import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {

  const DropdownWidget({Key? key}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  TypePerson dropdownValue = TypePerson.proveedor;
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
            items: const[
              DropdownMenuItem(value: TypePerson.cliente,child:  Text('Cliente'),),
              DropdownMenuItem(value: TypePerson.proveedor,child:  Text('Proveedor'),),
              DropdownMenuItem(value: TypePerson.vendedor ,child:  Text('Vendedor'),),
            ],
            onChanged: (TypePerson? value){
              setState(() {
                dropdownValue = value?? TypePerson.cliente;
                print('hola');
                print(dropdownValue);
              });
            },
          )
        ],
      ),
    );
  }
}