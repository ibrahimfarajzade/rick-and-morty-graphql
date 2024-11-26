import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_characters/presentation/bloc/character_event.dart';
import 'package:rick_and_morty_characters/presentation/bloc/character_state.dart';
import 'package:rick_and_morty_characters/presentation/widgets/character_card.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

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
          } else if (state is CharacterLoaded) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return CharacterCard(character: character);
              },
            );
          } else if (state is CharacterError) {
            return const Center(
              child: Text(
                'Failed to load characters',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(
            child: Text(
              'Press the button to load characters',
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger the LoadCharacters event
          context.read<CharacterBloc>().add(LoadCharacters());
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
