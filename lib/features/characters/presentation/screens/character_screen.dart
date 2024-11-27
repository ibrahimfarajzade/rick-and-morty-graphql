import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/bloc/character_event.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/bloc/character_state.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/widgets/character_card.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  Widget _buildError() => const Center(
        child: Center(
          child: Text(
            'Failed to load characters',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );

  Widget _buildCharacterList(List<Character> characters, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<CharacterBloc>().add(LoadCharactersEvent());
      },
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return CharacterCard(character: character);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Characters'),
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CharacterLoaded) {
            if (state.characters.isEmpty) {
              return const Center(child: Text('No characters found.'));
            }
            return _buildCharacterList(state.characters, context);
          }

          if (state is CharacterError) {
            return _buildError();
          }

          return const Center(
            child: Text(
              'Press the button to load characters',
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          return state is CharacterLoaded
              ? const SizedBox()
              : FloatingActionButton(
                  onPressed: () => context.read<CharacterBloc>().add(LoadCharactersEvent()),
                  child: const Icon(Icons.download),
                );
        },
      ),
    );
  }
}
