import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/detail_sale_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/type_sale.dart';
import 'package:hive/hive.dart';

part 'sale_model.g.dart';

@HiveType(typeId: 4)
class SaleModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  List<DetailSaleModel> detail;
  
  SaleModel({ required this.id , required this.date, required this.detail});
  // Hive fields go here

  double get getTotal {
    double total = 0;
    for (var element in detail) {
      if(element.typeSale == TypeSale.pagado){
        total = total + (element.count * element.price);
      }
    }
    return total;
  }

  double get getSaleTotal {
    double saleTotal = 0;
    for (var element in detail) { 
      if(element.price >0 && element.typeSale == TypeSale.pagado ){
      saleTotal = saleTotal + (element.count * element.price);
      }
    }
    return saleTotal;
  }

  double get getSpentTotal {
    double spentTotal = 0;
    for (var element in detail) { 
      if(element.price <0 && element.typeSale == TypeSale.pagado ){
        spentTotal = spentTotal + (element.count * element.price);
      }
    }
    return spentTotal;
  }

}