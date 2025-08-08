import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/favorite_pokemons/favorites_provider.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/pokemons/pokemon_provider.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_card.dart';

class PokemonFavoriteListScreen extends ConsumerStatefulWidget {
  const PokemonFavoriteListScreen({super.key});

  @override
  ConsumerState<PokemonFavoriteListScreen> createState() => PokemonFavoriteListScreenState();
}

class PokemonFavoriteListScreenState extends ConsumerState<PokemonFavoriteListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesProvider.notifier).loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoritesProvider);
    final pokemonState = ref.watch(pokemonProvider);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(favoritesProvider.notifier).loadFavorites();
          },
          child: Builder(
            builder: (context) {
              final favoritePokemon = pokemonState.pokemonList
                  .where((pokemon) => favorites.favorites.contains(pokemon.id)).toList();
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: favoritePokemon.length,
                    itemBuilder: (context, index) {
                      final pokemon = favoritePokemon[index];
                      return PokemonCard(pokemon: pokemon);
                    },
                  );
            },
          ),
        ),
      ),
    );
  }
}