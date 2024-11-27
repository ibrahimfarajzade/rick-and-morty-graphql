import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_characters/core/locator/locator_registrant.dart';
import 'package:rick_and_morty_characters/features/characters/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_characters/features/characters/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_characters/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_characters/features/characters/domain/usecases/get_characters.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_characters/qraphql/client.dart';

class CharacterLocatorRegistrant implements LocatorRegistrant {
  @override
  Future<void> register() async {
    // Register GraphQL Client as a singleton
    locator.registerLazySingleton(() => GraphQLConfig.initializeClient());

    // Register Remote Data Source
    locator.registerLazySingleton<CharacterRemoteDataSource>(
      () => CharacterRemoteDataSourceImpl(client: locator.get<GraphQLClient>()),
    );

    // Register Repository
    locator.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(remoteDataSource: locator.get<CharacterRemoteDataSource>()),
    );

    // Register Use Case
    locator.registerLazySingleton(
      () => GetCharacters(repository: locator.get<CharacterRepository>()),
    );

    // Register Bloc
    locator.registerFactory(
      () => CharacterBloc(getCharacters: locator.get<GetCharacters>()),
    );
  }
}
