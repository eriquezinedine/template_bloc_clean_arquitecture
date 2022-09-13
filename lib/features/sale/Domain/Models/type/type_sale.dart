import 'package:hive/hive.dart';

part 'type_sale.g.dart';

@HiveType(typeId: 3)
enum TypeSale {
  @HiveField(0)
  pagado,

  @HiveField(1)
  deuda,
}