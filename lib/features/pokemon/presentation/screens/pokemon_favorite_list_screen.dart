import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/favorite_pokemons/favorites_provider.dart';
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
    final favoritesState = ref.watch(favoritesProvider);
    
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(favoritesProvider.notifier).loadFavorites();
          },
          child: favoritesState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : favoritesState.favoritePokemonList.isEmpty
                  ? const Center(
                      child: Text(
                        'No tienes Pokémon favoritos',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: favoritesState.favoritePokemonList.length,
                      itemBuilder: (context, index) {
                        final pokemon = favoritesState.favoritePokemonList[index];
                        return PokemonCard(pokemon: pokemon);
                      },
                    ),
        ),
      ),
    );
  }
}