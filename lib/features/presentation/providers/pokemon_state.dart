import 'package:pokedex_app/features/domain/entities/pokemon_service_entity.dart';

class PokemonState {
  final List<PokemonServiceEntity> pokemonList;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMoreData;
  final bool hasError;
  final String errorMessage;
  final int currentOffset;

  const PokemonState({
    this.pokemonList = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMoreData = false,
    this.hasError = false,
    this.errorMessage = '',
    this.currentOffset = 0,
  });

  factory PokemonState.initial() {
    return const PokemonState(
      pokemonList: [],
      isLoading: false,
      isLoadingMore: false,
      hasMoreData: false,
      hasError: false,
      errorMessage: '',
      currentOffset: 0,
    );
  }

  PokemonState copyWith({
    List<PokemonServiceEntity>? pokemonList,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMoreData,
    bool? hasError,
    String? errorMessage,
    int? currentOffset,
  }) {
    return PokemonState(
      pokemonList: pokemonList ?? this.pokemonList,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      currentOffset: currentOffset ?? this.currentOffset,
    );
  }
}