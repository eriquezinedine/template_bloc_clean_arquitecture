import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:hive/hive.dart';

class PersonService{
  late Box<PersonModel> _person;

  Future<void> init() async{
    Hive.registerAdapter(PersonModelAdapter());
    _person = await Hive.openBox<PersonModel>('person');
    //* lAS SIGUIENTES LINEAS DE CODIGO ES PARA COMPROBAR QUE REALMENTE SE CONECTA
    // _person.add(PersonModel(name: 'zinedine',celular: '987654321', idType: 0));
    // _person.add(PersonModel(name: 'jeanpierre',celular: '999888777', idType: 1));
  }

  //* Obtener personas
  List<PersonModel> getPersons() => _person.values.toList();

  //* Agregar personas
  void addPerson(PersonModel person){
    _person.add(person);
  }

  //* Eliminar personas -- las buscas
  Future<void> removePerson(PersonModel person) async{
    final personToRemove = _person.values.firstWhere((element) => element.name == person.name);
    await personToRemove.delete();
  }

  Future<void> udatePerson({required PersonModel person, required PersonModel editPerson}) async{
    final personToUpdate = _person.values.firstWhere((element) => element.name == person.name);
    personToUpdate.name = editPerson.name;
    personToUpdate.celular = editPerson.celular;
    personToUpdate.idType = editPerson.idType;
    // print();
    print(personToUpdate == editPerson);
    await personToUpdate.save();
  }
}