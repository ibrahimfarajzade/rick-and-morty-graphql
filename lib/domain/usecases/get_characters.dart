import 'package:rick_and_morty_characters/core/usecase/usecase.dart';
import 'package:rick_and_morty_characters/domain/entities/character.dart';
import 'package:rick_and_morty_characters/domain/repositories/character_repository.dart';

class GetCharacters implements UseCase<List<Character>, NoParams> {
  final CharacterRepository repository;

  GetCharacters({required this.repository});

  @override
  Future<List<Character>> call(NoParams params) async {
    return await repository.getCharacters();
  }
}
