import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/favorite_pokemons/favorites_state.dart';
import 'package:pokedex_app/features/pokemon/services/favorite_services.dart';

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  FavoritesNotifier() : super(const FavoritesState(favorites: [])) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = state.copyWith(isLoading: true);
    try{
      final favorites = await FavoriteServices.getFavorites();
      state = state.copyWith(favorites: favorites, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      debugPrint('Error $e');
    }
  }

  Future<void> addFavorites(int pokemonId) async {
    final success = await FavoriteServices.addFavorites(pokemonId);
    if (success) {
      final updatedFavorites = [...state.favorites, pokemonId];
      state = state.copyWith(favorites: updatedFavorites);
    }
  }

  Future<void> removeFromFavorites(int pokemonId) async {
    final success = await FavoriteServices.removeFavorites(pokemonId);
    if (success) {
      final updatedFavorites = state.favorites.where((id) => id != pokemonId).toList();
      state = state.copyWith(favorites: updatedFavorites);
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

  Future<void> clearAllFavorites(int pokemonId) async {
    final success = await FavoriteServices.clearAllFavorites();
    if (success) {
      state = state.copyWith(favorites: []);
    }
  }

  int get favoritesCount => state.favorites.length;
}
