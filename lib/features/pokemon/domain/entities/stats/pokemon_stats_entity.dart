import 'package:pokedex_app/features/pokemon/domain/entities/stats/pokemon_stat_entity.dart';

class PokemonStatsEntity {
  final List<PokemonStatEntity> stats;

  const PokemonStatsEntity({
    required this.stats,
  });
}
