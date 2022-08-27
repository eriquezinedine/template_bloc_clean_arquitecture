import 'package:clean_arquitecture_bloc_hive/features/person/Domain/services/person_service.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/person_screen.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/widgets/push_person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final personService = PersonService();
  await personService.init();
  runApp( MyApp( personService: personService, ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.personService}) : super(key: key);
  final PersonService personService;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => personService
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        routes: {
          'person':( BuildContext context)=>BlocProvider.value(
                                value: BlocProvider.of<PersonBloc>(context),
                                child: const PushPerson(),
                              )
        },
        home: const PersonScreen(),
      ),
    );
  }
}
