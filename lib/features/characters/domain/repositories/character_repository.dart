import 'package:rick_and_morty_characters/features/characters/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters();
}
