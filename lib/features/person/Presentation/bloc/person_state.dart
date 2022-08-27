part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();
}

class PersonInitial extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonLoadedState extends PersonState{
  final List<PersonModel> persons;
  const PersonLoadedState(this.persons);

  @override
  List<Object?> get props => [persons];
}
