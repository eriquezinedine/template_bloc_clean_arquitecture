import 'package:clean_arquitecture_bloc_hive/features/person/Domain/repository/person_local_repository.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/screens/person_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final personRepository = PersonRepository();
  await personRepository.init();
  runApp( MyApp( personRepository: personRepository, ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.personRepository}) : super(key: key);
  final PersonRepository personRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => personRepository //!Agregar instancia de clases
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PersonBloc(RepositoryProvider.of<PersonRepository>(context))
            ..add(const LoadPersonEvent())
          )
        ],
        child: const MaterialTheme()
      ),
    );
  }
}

class MaterialTheme extends StatelessWidget {
  const MaterialTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      // routes: const {
        // '/person':( BuildContext context)=>BlocProvider.value(
        //                       value: BlocProvider.of<PersonBloc>(context),
        //                       child: const PersonRegisterScreen(),
        //                     )
        // '/person':( BuildContext context)=>BlocProvider(
        //             create: (context)=>  BlocProvider.of<PersonBloc>(context),
        //             child: const PersonRegisterScreen(),
        //           )
      // },
      home: const PersonScreen(),
    );
  }
}
