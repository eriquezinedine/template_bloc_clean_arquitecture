import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/type_sale.dart';
import 'package:hive/hive.dart';

part 'detail_sale_model.g.dart';

@HiveType(typeId: 2)
class DetailSaleModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String description;
  @HiveField(2)
  double count;
  @HiveField(3)
  double price;
  @HiveField(4)
  PersonModel person;
  @HiveField(6)
  TypeSale typeSale;

  DetailSaleModel({required this.id ,required this.description, required this.count, required this.price, required this.person, required this.typeSale});
  // Hive fields go here
}


