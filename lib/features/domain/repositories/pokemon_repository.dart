import 'package:pokedex_app/features/domain/entities/pokemon_service_entity.dart';

abstract class PokemonRepository {
  
  //* Obtenemos listado de pokemones
  Future<List<PokemonServiceEntity>> getPokemonList({
    int offset = 0,
    int limit = 20,
  });

  //* Obtenemos un pokemon por su ID
  Future<PokemonServiceEntity> getPokemonById(int id);
}