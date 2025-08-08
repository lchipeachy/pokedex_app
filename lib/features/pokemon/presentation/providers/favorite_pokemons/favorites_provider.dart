import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/pokemon/infraestructure/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/favorite_pokemons/favorites_notifier.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/favorite_pokemons/favorites_state.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  final repository = PokemonRepositoryImpl();
  return FavoritesNotifier(repository);
});

//? PROVIDER PARA SABER SI ES UN FAVORITO
final isFavoriteProvider = Provider.family<bool, int>((ref, pokemonId) {
  final favoritesState = ref.watch(favoritesProvider);
  return favoritesState.favorites.contains(pokemonId);
});

final favoritesCountProvider = Provider<int>((ref) {
  final favoritesState = ref.watch(favoritesProvider);
  return favoritesState.favorites.length;
});