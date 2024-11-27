import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/core/usecase/usecase.dart';
import 'package:rick_and_morty_characters/domain/usecases/get_characters.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters _getCharacters;

  CharacterBloc({required GetCharacters getCharacters})
      : _getCharacters = getCharacters,
        super(CharacterInitial()) {
    on<LoadCharactersEvent>((_onLoadCharactersEvent));
  }

  Future _onLoadCharactersEvent(LoadCharactersEvent event, emit) async {
    if (state is CharacterLoading) return;
    emit(CharacterLoading());

    try {
      final characters = await _getCharacters(NoParams());
      emit(CharacterLoaded(characters: characters));
    } catch (_) {
      emit(CharacterError());
    }
  }
}
