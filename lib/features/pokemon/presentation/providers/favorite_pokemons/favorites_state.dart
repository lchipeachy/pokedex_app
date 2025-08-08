import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_service_entity.dart';

class FavoritesState {
  final List<int> favorites;
  final List<PokemonServiceEntity> favoritePokemonList;
  final bool isLoading;

  const FavoritesState({
    required this.favorites,
    this.favoritePokemonList = const [],
    this.isLoading = false,
  });

  FavoritesState copyWith({
    List<int>? favorites,
    List<PokemonServiceEntity>? favoritePokemonList,
    bool? isLoading,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      favoritePokemonList: favoritePokemonList ?? this.favoritePokemonList,
      isLoading: isLoading ?? this.isLoading,
    );
  } 
}