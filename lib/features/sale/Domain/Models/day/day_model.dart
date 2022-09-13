import 'package:hive/hive.dart';

part 'day_model.g.dart';

@HiveType(typeId: 4)
class DayModel extends HiveObject {
  @HiveField(0)
  int idDay;
  @HiveField(1)
  DateTime date;

  DayModel({required this.idDay, required this.date});
  // Hive fields go here
}