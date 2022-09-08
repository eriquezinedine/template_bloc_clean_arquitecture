import 'package:hive/hive.dart';

part 'day_model.g.dart';

@HiveType()
class DayModel extends HiveObject {
  @HiveField(0)
  String id;
  // Hive fields go here
}