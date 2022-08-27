import 'package:bloc/bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/services/person_service.dart';
import 'package:equatable/equatable.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonService _personService;

  PersonBloc(this._personService) : super(PersonInitial()) {
    on<PersonEvent>((event, emit) {
      final persons = _personService.getPersons();
      emit(PersonLoadedState(persons));
    });

    on<DeletePersonEvent>((event, emit) async{
      await _personService.removePerson(event.person);
      emit(PersonLoadedState(_personService.getPersons()));
    });

    on<AddPersonEvent>((event, emit) {
      _personService.addPerson(event.person);
      emit(PersonLoadedState(_personService.getPersons()));
    });

  }
}
