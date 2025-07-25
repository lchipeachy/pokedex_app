import 'package:flutter/material.dart';
import 'package:pokedex_app/features/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonListScreen extends StatelessWidget {
  PokemonListScreen({super.key});

  final List<PokemonEntity> pokemonList = [
    PokemonEntity(
      id: '001', 
      name: 'Bulbasaur', 
      types: ['Hoja', 'Venenoso'],
      image: 'assets/pokemons/bulbasaur.png', 
      backgroundColor: '',
    ),
    PokemonEntity(
      id: '002', 
      name: 'Charizard', 
      types: ['Fuego', 'Volador'],
      image: 'assets/pokemons/charizard.png', 
      backgroundColor: '',
    ),
    PokemonEntity(
      id: '003', 
      name: 'Pikachu', 
      types: ['Eléctrico'],
      image: 'assets/pokemons/pikachu.png', 
      backgroundColor: '',
    ),
    PokemonEntity(
      id: '004', 
      name: 'Squirtle', 
      types: ['Agua'],
      image: 'assets/pokemons/squirtle.png', 
      backgroundColor: '',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            return PokemonCard(
              pokemon: pokemonList[index],
            );
          },
        ),
      ),
    );
  }
}