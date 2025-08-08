class FavoritesState {
  final List<int> favorites;
  final bool isLoading;

  const FavoritesState({
    required this.favorites,
    this.isLoading = false,
  });

  FavoritesState copyWith({
    List<int>? favorites,
    bool? isLoading,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
    );
  } 
}