import 'package:clean_arquitecture_bloc_hive/core/presentation/widgets/label_row_widget.dart';
import 'package:clean_arquitecture_bloc_hive/core/presentation/widgets/page_widget.dart';
import 'package:clean_arquitecture_bloc_hive/core/styles/theme.dart';
import 'package:clean_arquitecture_bloc_hive/core/utils/appbar.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/detail_sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/widgets/button_option.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.date, required this.detail}) : super(key: key);
  final DateTime date;
  final DetailSaleModel detail;

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      appbar: appbar(title: 'Resumen'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      detail.description.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 5,),
                    LabelRowWidget(
                      label: 'Fecha: ',
                      content: DateFormat('MMMM d').format(date)
                    ),
                    LabelRowWidget(
                      label: 'Contacto: ',
                      content: detail.person.name!
                    ),
                    LabelRowWidget(
                      label: 'Metodo de Pago: ',
                      content: detail.typeSale.name
                    ),
                    LabelRowWidget(
                      label: 'Total: ',
                      content: '${(detail.price * detail.count)}'.replaceAll('-', ''),
                    ),
                  ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonOption(
                hero: 1,
                color: ThemeColor.textSecundary,
                title: 'Editar',
                icon: Icons.edit,
                onPressed: () {
                },
              ),
              ButtonOption(
                hero: 2,
                color: Colors.green,
                title: 'Aprobar',
                icon: Icons.add_to_photos_sharp,
                onPressed: () {
                },
              ),
              ButtonOption(
                hero: 3,
                color: ThemeColor.redPrimary,
                title: 'Eliminar',
                icon: Icons.delete,
                onPressed: () {
                },
              ),
            ],
          )
        ],
      )
    );
  }
}

