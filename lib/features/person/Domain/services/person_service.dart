import 'package:clean_arquitecture_bloc_hive/features/person/Domain/model/person_model.dart';
import 'package:hive/hive.dart';

class PersonService{
  late Box<PersonModel> _person;

  Future<void> init() async{
    Hive.registerAdapter(PersonModelAdapter());
    _person = await Hive.openBox<PersonModel>('person');
    _person.add(PersonModel(name: 'Fanny Salinas',celular: '987654321', idType: 0));
    _person.add(PersonModel(name: 'Hugo idiota',celular: '999888777', idType: 1));
  }

  List<PersonModel> getPersons() => _person.values.toList();

  void addPerson(PersonModel person){
    _person.add(person);
  }

  Future<void> removePerson(PersonModel person) async{
    final personToRemove = _person.values.firstWhere((element) => element.name == person.name);
    await personToRemove.delete();
  }
}