part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class LoadPersonEvent extends PersonEvent{
  const LoadPersonEvent();

  @override
  List<Object> get props => [];
}


class DeletePersonEvent extends PersonEvent{
  final PersonModel person;
  const DeletePersonEvent({required this.person});

  @override
  List<Object?> get props => [];
}

class AddPersonEvent extends PersonEvent{
  final PersonModel person;
  const AddPersonEvent({required this.person});

  @override
  List<Object?> get props => [];
}

class UpdatePersonEvent extends PersonEvent{
  final PersonModel person;
  final PersonModel editPerson;

  const UpdatePersonEvent({required this.person, required this.editPerson});

  @override
  List<Object?> get props => [];
}