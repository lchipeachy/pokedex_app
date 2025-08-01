import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/features/infraestructure/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_app/features/presentation/providers/pokemon_notifier.dart';
import 'package:pokedex_app/features/presentation/providers/pokemon_state.dart';

final pokemonProvider = StateNotifierProvider<PokemonNotifier, PokemonState>((ref) {
  final repository = PokemonRepositoryImpl();
  return PokemonNotifier(repository);
});