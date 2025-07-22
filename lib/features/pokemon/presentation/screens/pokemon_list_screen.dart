import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          PokemonCard(),
        ],
      )
    );
  }
}