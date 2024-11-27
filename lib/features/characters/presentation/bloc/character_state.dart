import 'package:rick_and_morty_characters/features/characters/domain/entities/character.dart';
import 'package:equatable/equatable.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded({required this.characters});

  @override
  List<Object?> get props => [characters];
}

class CharacterError extends CharacterState {}
