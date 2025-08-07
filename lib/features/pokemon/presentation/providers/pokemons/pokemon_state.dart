import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_service_entity.dart';

class PokemonState {
  final List<PokemonServiceEntity> pokemonList;
  final List<PokemonServiceEntity> searchResults;
  final bool isLoading;
  final bool isLoadingMore;
  final bool isSearching;
  final bool hasMoreData;
  final bool hasError;
  final String errorMessage;
  final int currentOffset;
  final String searchQuery;

  const PokemonState({
    this.pokemonList = const [],
    this.searchResults = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.isSearching = false,
    this.hasMoreData = false,
    this.hasError = false,
    this.errorMessage = '',
    this.currentOffset = 0,
    this.searchQuery = '',
  });

  factory PokemonState.initial() {
    return const PokemonState(
      pokemonList: [],
      searchResults: [],
      isLoading: false,
      isLoadingMore: false,
      isSearching: false,
      hasMoreData: false,
      hasError: false,
      errorMessage: '',
      currentOffset: 0,
      searchQuery: '',
    );
  }

  PokemonState copyWith({
    List<PokemonServiceEntity>? pokemonList,
    List<PokemonServiceEntity>? searchResults,
    bool? isLoading,
    bool? isLoadingMore,
    bool? isSearching,
    bool? hasMoreData,
    bool? hasError,
    String? errorMessage,
    int? currentOffset,
    String? searchQuery,
  }) {
    return PokemonState(
      pokemonList: pokemonList ?? this.pokemonList,
      searchResults: searchResults ?? this.searchResults,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isSearching: isSearching ?? this.isSearching,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      currentOffset: currentOffset ?? this.currentOffset,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  //* Obtener la lista 
  List<PokemonServiceEntity> get displayList {
    return searchQuery.isNotEmpty ? searchResults : pokemonList;
  }

  bool get isInSearchMode => searchQuery.isNotEmpty;
}