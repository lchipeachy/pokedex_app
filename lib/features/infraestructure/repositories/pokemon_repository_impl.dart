import 'package:pokedex_app/features/domain/datasource/pokemon_datasource.dart';
import 'package:pokedex_app/features/domain/entities/pokemon_service_entity.dart';
import 'package:pokedex_app/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_app/features/infraestructure/datasource/pokemon_datasource_impl.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource pokemonDataSource;

  PokemonRepositoryImpl({PokemonDataSource? pokemonDataSource})
      : pokemonDataSource = pokemonDataSource ?? PokemonDatasourceImpl();

  @override
  Future<List<PokemonServiceEntity>> getPokemonList({
    int offset = 0, 
    int limit = 20
    }) async {
    return await pokemonDataSource.getPokemonList(
      offset: offset, 
      limit: limit
    );
  }

  @override
  Future<PokemonServiceEntity> getPokemonById(int id) async {
    return await pokemonDataSource.getPokemonById(id);
  }
}