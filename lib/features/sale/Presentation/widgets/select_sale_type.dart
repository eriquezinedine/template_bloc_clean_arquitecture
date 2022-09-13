import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/type/type_sale.dart';
import 'package:flutter/material.dart';

class SelectSaleType extends StatefulWidget {
  const SelectSaleType({
    Key? key,
    required this.onChageSelect,
    this.selecType
  }) : super(key: key);
  final Function(TypeSale value) onChageSelect;
  final TypeSale? selecType;

  @override
  State<SelectSaleType> createState() => _SelectSaleTypeState();
}

class _SelectSaleTypeState extends State<SelectSaleType> {

  TypeSale select = TypeSale.pagado;

  @override
  void initState() {
    super.initState();
    if(widget.selecType != null){
        select = widget.selecType!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    select = TypeSale.pagado;
                    widget.onChageSelect(select);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  decoration: BoxDecoration(
                    color: select == TypeSale.pagado? Colors.green: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                    ),
                    border: Border.all(
                      color: select == TypeSale.pagado? Colors.transparent: ThemeColor.boderPrimary,
                      width: 4
                    )
                  ),
                  child: Text(
                    'Pagado',
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      color:  select == TypeSale.pagado? ThemeColor.backPrimary: ThemeColor.textSecundary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    select = TypeSale.deuda;
                    widget.onChageSelect(select);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  decoration:BoxDecoration(
                    color: select == TypeSale.deuda? Colors.redAccent: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                    ),
                    border: Border.all(
                      color: select == TypeSale.deuda? Colors.transparent: ThemeColor.boderPrimary,
                      width: 4
                    )
                  ),
                  child: Text(
                    'Deuda',
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      color: select == TypeSale.deuda? ThemeColor.backPrimary : ThemeColor.textSecundary ,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}