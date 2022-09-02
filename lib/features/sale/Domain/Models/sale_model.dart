import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/detail_sale_model.dart';
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
      total = total + (element.count * element.price);
    }
    return total;
  }

}