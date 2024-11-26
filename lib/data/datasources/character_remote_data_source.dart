import 'package:rick_and_morty_characters/data/models/character_model.dart';
import 'package:rick_and_morty_characters/qraphql/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharacters();
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final GraphQLClient client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final result = await client.query(QueryOptions(document: gql(getCharactersQuery)));

    if (result.hasException) {
      throw const ServerException();
    }

    final data = result.data?['characters']['results'] as List;

    return data.map((character) => CharacterModel.fromJson(character)).toList();
  }
}
