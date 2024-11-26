import 'package:rick_and_morty_characters/core/error/exception.dart';
import 'package:rick_and_morty_characters/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_characters/domain/entities/character.dart';
import 'package:rick_and_morty_characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Character>> getCharacters() async {
    try {
      return await remoteDataSource.getCharacters();
    } on ServerException {
      rethrow;
    }
  }
}
