import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/pokemons/pokemon_state.dart';

class PokemonNotifier extends StateNotifier <PokemonState>{
  final PokemonRepository repository;
  static const int _limit = 10;

  PokemonNotifier(this.repository) : super(PokemonState.initial());

  Future<void> getPokemonList({bool isInitialLoad = true}) async {
    try {
      if(isInitialLoad) {
        state = state.copyWith(
          isLoading: true, 
          currentOffset: 0,
          errorMessage: '',
          hasError: false,
        );
      } else {
        state = state.copyWith(
          isLoadingMore: true,
          errorMessage: '',
          hasError: false,
        );
      }

      final pokemonList = await repository.getPokemonList(
        offset: isInitialLoad ? 0 : state.currentOffset,
        limit: _limit,
      );

      if(pokemonList.isEmpty) {
        state = state.copyWith(
          hasMoreData: false,
          isLoading: false,
          isLoadingMore: false,
        );
        return;
      }

      final updateList = isInitialLoad
          ? pokemonList
          : [...state.pokemonList, ...pokemonList];

      state = state.copyWith(
        pokemonList: updateList,
        isLoading: false,
        isLoadingMore: false,
        currentOffset: isInitialLoad ? _limit : state.currentOffset + _limit,
        hasMoreData: pokemonList.length == _limit,
      );
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> loadMorePokemon() async {
    if(state.isLoadingMore || !state.hasMoreData) return;
    await getPokemonList(isInitialLoad: false);
  }

  Future<void> refreshPokemonList() async {
    await getPokemonList(isInitialLoad: true);
  }

  //* Método para buscar Pokémon por query-string
  Future<void> searchPokemon(String query) async {
    if (query.trim().isEmpty) {
      clearSearch();
      return;
    }

    try {
      state = state.copyWith(
        isSearching: true,
        searchQuery: query.trim(),
        errorMessage: '',
        hasError: false,
      );

      final searchResults = await repository.searchPokemonByQuery(query.trim());
      
      state = state.copyWith(
        searchResults: searchResults,
        isSearching: false,
      );
    } catch (e) {
      debugPrint('Error en búsqueda: $e');
      state = state.copyWith(
        isSearching: false,
        searchResults: [],
        hasError: true,
        errorMessage: 'Error al buscar Pokémon: $e',
      );
    }
  }

  //* Método para limpiar la búsqueda
  void clearSearch() {
    state = state.copyWith(
      searchResults: [],
      searchQuery: '',
      isSearching: false,
      errorMessage: '',
      hasError: false,
    );
  }
}