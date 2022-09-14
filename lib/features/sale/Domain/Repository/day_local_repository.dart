
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/day/day_model.dart';
import 'package:hive/hive.dart';

class DayRepository{
  late Box<DayModel> _days;

  Future<void> init() async{
    Hive.registerAdapter(DayModelAdapter());
    _days = await Hive.openBox<DayModel>('day');
  }

  //* Obtener dias registrados
  List<DayModel> getDays()=> _days.values.toList();


  //* Agregar Dias
  Future<void> addDay(DayModel day) async{
    final DayModel dayToSelect = _days.values.firstWhere(
        (element)=> element.idDay == day.idDay,
        orElse: ()=>DayModel(
          idDay: -1,
          date: DateTime.now()
        )
      );
    if(dayToSelect.idDay == -1){
      await _days.add(day);
    }
  }

  List<DayModel> deleteSale(DayModel day){
    final DayModel saleToSelect = _days.values.firstWhere(
      (element) => element.idDay == day.idDay,
      orElse: () => DayModel(idDay: -1, date: DateTime.now())
      );
    if( saleToSelect.idDay != -1 ){
      saleToSelect.delete();
    }
    return _days.values.toList();
  }


}