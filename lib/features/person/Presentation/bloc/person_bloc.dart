import 'package:bloc/bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/services/person_service.dart';
import 'package:equatable/equatable.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonService _personService;


  @override
  Future<void> close() {
    // dispose
    print('se cerro');
    return super.close();
  }


  PersonBloc(this._personService) : super(PersonInitial()) {
    on<PersonEvent>((event, emit) {
      // if(isClosed) return;
      final persons = _personService.getPersons();
      emit(PersonLoadedState(persons));
    });

    on<DeletePersonEvent>((event, emit) async{
      // if(isClosed) return;
      await _personService.removePerson(event.person);
      emit(PersonLoadedState(_personService.getPersons()));
    });

    on<AddPersonEvent>((event, emit) {
      // if(isClosed) return;
      _personService.addPerson(event.person);
      emit(PersonLoadedState(_personService.getPersons()));
    });

    on<UpdatePersonEvent>((event, emit)  async{
      // if(isClosed) return;
      await _personService.udatePerson(person: event.person, editPerson: event.editPerson);
      final updatePerson = _personService.getPersons().map((element) => element.name == event.person.name? event.editPerson: element).toList(); //* Si funciono
      emit(PersonLoadedState(updatePerson));
      /* 
        Se necesita el primer metodo para cambiar internamente los valores del elemento
        Y
        Luego en la vista lo modifico con el map y cambiando el estado 
       */
    });

  }
}
