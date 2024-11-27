import 'package:rick_and_morty_characters/features/characters/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({required super.name, required super.image});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      image: json['image'],
    );
  }
}
