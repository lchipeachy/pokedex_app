import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 50),
            // Bulbasaur
            PokemonCard(
              id: '001',
              name: 'Bulbasaur',
              image: 'assets/pokemons/bulbasaur.png',
              types: ['Grama', 'Venenoso'],
              backgroundColor: '0xFF63BC5A',
              typeIcon: 'assets/pokemons_types/hoja.svg',
            ),
            SizedBox(height: 16),
            
            // Charmander
            PokemonCard(
              id: '004',
              name: 'Charmander',
              image: 'assets/pokemons/charmander.png',
              types: ['Fuego'],
              backgroundColor: '0xFFFF9D55',
              typeIcon: 'assets/pokemons_types/fuego.svg',
            ),
            SizedBox(height: 16),

            // Squirtle
            PokemonCard(
              id: '007',
              name: 'Squirtle',
              image: 'assets/pokemons/squirtle.png',
              types: ['Agua'],
              backgroundColor: '0xFF5090D6',
              typeIcon: 'assets/pokemons_types/agua.svg',
            ),
            SizedBox(height: 16),
            
            // Pikachu
            PokemonCard(
              id: '025',
              name: 'Pikachu',
              image: 'assets/pokemons/pikachu.png',
              types: ['Eléctrico'],
              backgroundColor: '0xFFF4D23C',
              typeIcon: 'assets/pokemons_types/electrico.svg',
            ),
          ],
        ),
      ),
    );
  }
}