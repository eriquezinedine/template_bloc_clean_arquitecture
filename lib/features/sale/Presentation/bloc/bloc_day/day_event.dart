part of 'day_bloc.dart';

abstract class DayEvent extends Equatable {
  const DayEvent();
}

class LoadDayEvent extends DayEvent{
  const LoadDayEvent();

  @override
  List<Object> get props => [];
}


class AddDayEvent extends DayEvent{
  final DayModel day;
  const AddDayEvent(this.day);

  @override
  List<Object?> get props => [day];

}

class DeleteDayEvent extends DayEvent{
  final DayModel day;
  const DeleteDayEvent(this.day);

  @override
  List<Object?> get props => [day];

}
