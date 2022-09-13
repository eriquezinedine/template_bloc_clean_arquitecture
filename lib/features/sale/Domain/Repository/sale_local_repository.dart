import 'package:clean_arquitecture_bloc_hive/core/utils/create_id.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/sale/sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/type/type_sale.dart';
import 'package:hive/hive.dart';


class SaleRepository{
  late Box<SaleModel> _sales;

  Future<void> init() async{
    Hive.registerAdapter(SaleModelAdapter());
    Hive.registerAdapter(TypeSaleAdapter());
    _sales = await Hive.openBox<SaleModel>('sale');
  }

  //* Obtener Ventas
  List<SaleModel> getSales() => _sales.values.toList();

  //* Agregar VEntas
  List<SaleModel> addSale(SaleModel sale){
    final SaleModel saleToSelect = _sales.values.firstWhere(
      (element) => element.idSale == sale.idSale,
      orElse: () => SaleModel(
        idSale: -1,
        idDay: -1,
        description: 'description',
        count: 0,
        price: 0,
        person: PersonModel(),
        typeSale: TypeSale.deuda),
      );
    if( saleToSelect.idSale == -1 ){
      _sales.add(sale);
    }
    return _sales.values.toList();
  }
}
