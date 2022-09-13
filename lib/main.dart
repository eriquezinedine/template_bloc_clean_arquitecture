import 'package:clean_arquitecture_bloc_hive/features/home/presentation/screens/home_screen.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Domain/repository/person_local_repository.dart';
import 'package:clean_arquitecture_bloc_hive/features/person/Presentation/bloc/person_bloc.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Repository/day_local_repository.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Domain/Repository/sale_local_repository.dart';
import 'package:clean_arquitecture_bloc_hive/features/sale/Presentation/bloc/bloc_day/day_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final personRepository = PersonRepository();
  final daysRepository = DayRepository();
  await personRepository.init();
  await daysRepository.init();
  runApp( MyApp( personRepository: personRepository, daysRepository: daysRepository, ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.personRepository, required this.daysRepository}) : super(key: key);
  final PersonRepository personRepository;
  final DayRepository daysRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => personRepository //!Agregar instancia de clases
        ),
        RepositoryProvider(
          create: (context) => daysRepository
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PersonBloc(RepositoryProvider.of<PersonRepository>(context))
            ..add(const LoadPersonEvent())
          ),
          BlocProvider(
            create: (context) => DayBloc(RepositoryProvider.of<DayRepository>(context))
            ..add(const LoadDayEvent())
          ),
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
      home: const HomeScreen(),
      // home: const PersonScreen(),
    );
  }
}
