part of 'day_bloc.dart';

abstract class DayState extends Equatable {
  const DayState();
}

class DayInitial extends DayState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DayLoadedState extends DayState{
  final List<DayModel> days;
  const DayLoadedState({
    required this.days,
  });

  @override
  List<Object?> get props => [days];
}