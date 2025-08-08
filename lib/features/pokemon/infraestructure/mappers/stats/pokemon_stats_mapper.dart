import 'package:pokedex_app/features/pokemon/domain/entities/stats/pokemon_stats_entity.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/stats/pokemon_stat_entity.dart';

class PokemonStatsMapper {
  static PokemonStatsEntity fromJson(Map<String, dynamic> json) {
    final statsList = json['stats'] as List<dynamic>;
    
    final stats = statsList.map((statJson) {
      return PokemonStatMapper.fromJson(statJson);
    }).toList();

    return PokemonStatsEntity(stats: stats);
  }
}

class PokemonStatMapper {
  static PokemonStatEntity fromJson(Map<String, dynamic> json) {
    return PokemonStatEntity(
      baseStat: json['base_stat'] ?? 0,
      effort: json['effort'] ?? 0,
      stat: StatMapper.fromJson(json['stat']),
    );
  }
}

class StatMapper {
  static StatEntity fromJson(Map<String, dynamic> json) {
    return StatEntity(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
