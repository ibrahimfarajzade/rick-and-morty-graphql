import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/core/usecase/usecase.dart';
import 'package:rick_and_morty_characters/domain/usecases/get_characters.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;

  CharacterBloc({required this.getCharacters}) : super(CharacterInitial()) {
    on<LoadCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters(NoParams());
        emit(CharacterLoaded(characters: characters));
      } catch (_) {
        emit(CharacterError());
      }
    });
  }
}
