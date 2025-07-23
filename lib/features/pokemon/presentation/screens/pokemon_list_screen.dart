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
            PokemonCard(),
          ],
        ),
      ),
    );
  }
}

class PokemonEntity {
  final String id;
  final String name;
  final String image;
  final String type;
  
  PokemonEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });
}