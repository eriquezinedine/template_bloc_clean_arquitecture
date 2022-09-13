import 'package:hive/hive.dart';

import '../../../../person/Domain/model/person_model.dart';
import '../type/type_sale.dart';

part 'sale_model.g.dart';


@HiveType(typeId: 2)
class SaleModel extends HiveObject {
  @HiveField(0)
  int idSale;
  @HiveField(1)
  int idDay;
  @HiveField(2)
  String description;
  @HiveField(3)
  double count;
  @HiveField(4)
  double price;
  @HiveField(5)
  PersonModel person;
  @HiveField(6)
  TypeSale typeSale;

  SaleModel({required this.idSale, required this.idDay ,required this.description, required this.count, required this.price, required this.person, required this.typeSale});
  // Hive fields go here
}


