
import 'package:clean_arquitecture_bloc_hive/core/presentation/widgets/input_widget.dart';
import 'package:clean_arquitecture_bloc_hive/core/utils/create_id.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/detail_sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/type_sale.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/bloc/sale_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/select_client.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/select_dary.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/select_sale_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaleRegisterScreen extends StatelessWidget {
  const SaleRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesBloc = BlocProvider.of<SaleBloc>(context);
    
    TextEditingController descriptionController = TextEditingController();
    TextEditingController countController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    TypeSale selectType = TypeSale.pagado;

    void changeTypeSale (TypeSale value){
      selectType = value;
    }

    late PersonModel personDefault = PersonModel();

    late DateTime dateDefault = DateTime.now();


    void changePersonModel(PersonModel person){
      personDefault = person;
    }

    void changeDate(DateTime value){
      dateDefault = value;
    }

    return  Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Nueva Venta', style: TextStyle(fontWeight: FontWeight.bold,),),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
            top: 8
          ),
          // height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20
          ),
          decoration: const BoxDecoration(
            color: Color(0xffF5F6F8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50)
            )
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SelectDay(
                  changeDateTime: changeDate,
                ),
                 const SizedBox(width: 15,),
                 SelectSaleType(
                  onChageSelect: changeTypeSale,
                  selecType: selectType,
                 ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: InputWidget(
                    typeInput: TextInputType.text,
                    label: 'Descripcion',
                    placeholder: 'ejem: Leche',
                    icon: Icons.production_quantity_limits,
                    controller: descriptionController
                  )
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: InputWidget(
                    typeInput: TextInputType.number,
                    label: 'Cantidad',
                    placeholder: 'ejem: 20',
                    icon: Icons.add_circle_outline_sharp,
                    controller: countController
                  )
                ),
              ],
            ),
            InputWidget(
              typeInput: TextInputType.number,
              label: 'Precio',
              prefixText: 'S/. ',
              placeholder: 'ejem: S/. 24',
              icon: Icons.production_quantity_limits,
              controller: priceController
            ),
            SelectClient(
              changePerson: changePersonModel,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10)
              ),
              onPressed: (){
                salesBloc.add(
                  AddSaleEvent(
                    date: dateDefault,
                    detail: DetailSaleModel(
                      count: double.parse(countController.text),
                      id: createId(DateTime.now()),
                      description: descriptionController.text,
                      person: personDefault,
                      price: double.parse(priceController.text),
                      typeSale: selectType
                    )
                  )
                );
                Navigator.pop(context);
              },
              child:  const Text(
                'Registrar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
              )
            ),
            const SizedBox(height: 20,)
          ],
        ),
      )
    );
  }
}
