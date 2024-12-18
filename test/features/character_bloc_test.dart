import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty_characters/core/usecase/usecase.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/bloc/character_event.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/bloc/character_state.dart';

import '../core/mock_generator.mocks.dart';

void main() {
  late MockGetCharacters mockGetCharacters;
  late CharacterBloc characterBloc;

  setUp(() {
    mockGetCharacters = MockGetCharacters();
    characterBloc = CharacterBloc(getCharacters: mockGetCharacters);
  });

  tearDown(() {
    characterBloc.close();
  });

  blocTest(
    'emits [CharacterLoading, CharacterLoaded] when LoadCharactersEvent succeeds',
    build: () {
      // Mock the GetCharacters to return a list of characters
      when(mockGetCharacters(NoParams())).thenAnswer((_) async => [
            const Character(name: 'Rick', image: 'image1.png'),
            const Character(name: 'Morty', image: 'image2.png'),
          ]);
      return characterBloc;
    },
    act: (bloc) => bloc.add(LoadCharactersEvent()),
    expect: () => [
      CharacterLoading(),
      CharacterLoaded(characters: const [
        Character(name: 'Rick', image: 'image.png'),
        Character(name: 'Morty', image: 'image2.png'),
      ]),
    ],
  );

  blocTest(
    'emits [CharacterLoading, CharacterError] when LoadCharactersEvent fails',
    build: () {
      // Arrange: Mock the GetCharacters use case to throw an exception
      when(mockGetCharacters(NoParams())).thenThrow(Exception());
      return characterBloc;
    },
    act: (bloc) => bloc.add(LoadCharactersEvent()),
    expect: () => [
      CharacterLoading(),
      CharacterError(),
    ],
  );
}
