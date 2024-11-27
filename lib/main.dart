import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_characters/core/locator/locator_registrant.dart';
import 'domain/usecases/get_characters.dart';
import 'presentation/bloc/character_bloc.dart';
import 'presentation/screens/character_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  await initHiveForFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CharacterBloc(getCharacters: locator.get<GetCharacters>()),
        ),
      ],
      child: MaterialApp(
        title: 'Rick and Morty App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CharacterScreen(),
      ),
    );
  }
}
