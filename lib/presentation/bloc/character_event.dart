import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {}

class LoadCharactersEvent extends CharacterEvent {
  @override
  List<Object?> get props => [];
}
