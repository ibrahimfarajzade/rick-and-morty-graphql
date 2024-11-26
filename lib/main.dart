import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'data/datasources/character_remote_data_source.dart';
import 'data/repositories/character_repository_impl.dart';
import 'domain/usecases/get_characters.dart';
import 'presentation/bloc/character_bloc.dart';
import 'presentation/screens/character_screen.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

    final GraphQLClient client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    );

    final characterRemoteDataSource = CharacterRemoteDataSourceImpl(client: client);
    final characterRepository = CharacterRepositoryImpl(remoteDataSource: characterRemoteDataSource);
    final getCharactersUseCase = GetCharacters(repository: characterRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CharacterBloc(getCharacters: getCharactersUseCase),
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
