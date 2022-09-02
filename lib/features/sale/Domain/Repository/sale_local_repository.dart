import 'package:clean_arquitecture_bloc_hive/core/utils/create_id.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/detail_sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/type_sale.dart';
import 'package:hive/hive.dart';

class SaleRepository {
  late Box<SaleModel> _sales;

  Future<void> init() async{
    Hive.registerAdapter(SaleModelAdapter());
    Hive.registerAdapter(TypeSaleAdapter());
    Hive.registerAdapter(DetailSaleModelAdapter());
    _sales = await Hive.openBox<SaleModel>('sale');
  }

  //* Obtener Ventas
  List<SaleModel> getSales() => _sales.values.toList();

  //* Agregar VEntas
  List<SaleModel> addSale(DateTime date, DetailSaleModel detail){
    int id = createIdSale(date);
    if( _sales.values.isEmpty ){
      _sales.add(
        SaleModel(
          id: id,
          date: date,
          detail: [detail]
        )
      );
    }else{
      final SaleModel saleToUpdate = _sales.values.firstWhere((element)=> element.id == id, orElse: ()=>SaleModel(id: -1, date: DateTime.now(), detail: []));
      // _sales.add(saleToUpdate);

      if(saleToUpdate.id != -1){
        saleToUpdate.detail.add(detail);
        saleToUpdate.save();
        print('zinedine Agregando nuevo gasto');
      }else{
        _sales.add(
        SaleModel(
          id: id,
          date: date,
          detail: [detail]
        )
      );
        print('Agregando nuevo dia de gasto');
      }

      // print('Nueva info: ${saleToUpdate.detail}' );
    }
    return _sales.values.toList();
    // SaleModel? saleToUpdate = _sales.values.firstWhere((element) => element.id == id);
    // print('Sale Zinedine: $saleToUpdate');
    // _sales.add(sale);
  }

  //* Eliminar venta
  Future<void> removeSale(SaleModel sale) async{
    final saleToRemove = _sales.values.firstWhere((element) => element.id == sale.id);
    await saleToRemove.delete();
  }

  Future<void> updateSale(SaleModel sale) async{
    final saleToUpdate = _sales.values.firstWhere((element) => element.id == sale.id);
    
    await saleToUpdate.save();
  }


}