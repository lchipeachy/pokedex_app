import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_service_entity.dart';
import 'package:pokedex_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/favorite_pokemons/favorites_state.dart';
import 'package:pokedex_app/features/pokemon/services/favorite_services.dart';

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final PokemonRepository _pokemonRepository;
  
  FavoritesNotifier(this._pokemonRepository) : super(const FavoritesState(favorites: [])) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = state.copyWith(isLoading: true);
    try{
      final favorites = await FavoriteServices.getFavorites();
      
      // Cargar la lista completa de Pokémon favoritos
      final List<PokemonServiceEntity> favoritePokemonList = [];
      for (final pokemonId in favorites) {
        try {
          final pokemon = await _pokemonRepository.getPokemonById(pokemonId);
          favoritePokemonList.add(pokemon);
        } catch (e) {
          debugPrint('Error cargando Pokémon con ID $pokemonId: $e');
        }
      }
      
      // Ordenar la lista por ID de forma ascendente
      favoritePokemonList.sort((a, b) => a.id.compareTo(b.id));
      
      state = state.copyWith(
        favorites: favorites, 
        favoritePokemonList: favoritePokemonList,
        isLoading: false
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      debugPrint('Error $e');
    }
  }

  Future<void> addFavorites(int pokemonId) async {
    final success = await FavoriteServices.addFavorites(pokemonId);
    if (success) {
      final updatedFavorites = [...state.favorites, pokemonId];
      
      // Cargar el nuevo Pokémon favorito
      try {
        final pokemon = await _pokemonRepository.getPokemonById(pokemonId);
        final updatedPokemonList = [...state.favoritePokemonList, pokemon];
        
        // Ordenar la lista por ID de forma ascendente
        updatedPokemonList.sort((a, b) => a.id.compareTo(b.id));
        
        state = state.copyWith(
          favorites: updatedFavorites,
          favoritePokemonList: updatedPokemonList
        );
      } catch (e) {
        debugPrint('Error cargando nuevo Pokémon favorito: $e');
        state = state.copyWith(favorites: updatedFavorites);
      }
    }
  }

  Future<void> removeFromFavorites(int pokemonId) async {
    final success = await FavoriteServices.removeFavorites(pokemonId);
    if (success) {
      final updatedFavorites = state.favorites.where((id) => id != pokemonId).toList();
      final updatedPokemonList = state.favoritePokemonList
          .where((pokemon) => pokemon.id != pokemonId)
          .toList();
      state = state.copyWith(
        favorites: updatedFavorites,
        favoritePokemonList: updatedPokemonList
      );
    }
  }

  bool isFavorite(int pokemonId) {
    return state.favorites.contains(pokemonId);
  }

  Future<void> toggleFavorites(int pokemonId) async {
    if(isFavorite(pokemonId)){
      await removeFromFavorites(pokemonId);
    } else {
      await addFavorites(pokemonId);
    }
  }

  Future<void> clearAllFavorites() async {
    final success = await FavoriteServices.clearAllFavorites();
    if (success) {
      state = state.copyWith(favorites: [], favoritePokemonList: []);
    }
  }

  int get favoritesCount => state.favorites.length;
}
