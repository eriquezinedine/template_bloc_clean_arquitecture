import 'package:bloc/bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Models/day/day_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Repository/day_local_repository.dart';
import 'package:equatable/equatable.dart';

part 'day_event.dart';
part 'day_state.dart';

class DayBloc extends Bloc<DayEvent, DayState> {
  final DayRepository _dayRepository;


  DayBloc(this._dayRepository) : super(DayInitial()) {
    on<DayEvent>((event, emit) {
      final days = _dayRepository.getDays();
      emit(DayLoadedState(days: days));
    });

    on<AddDayEvent>((event, emit) {
      _dayRepository.addDay(event.day);
      emit(
        DayLoadedState(
          days: _dayRepository.getDays()
          )
        );
    });

    on<DeleteDayEvent>((event, emit) {
      final listDay = _dayRepository.deleteSale(event.day);
      emit(
        DayLoadedState(
          days: listDay
          )
        );
    });
  }
}
