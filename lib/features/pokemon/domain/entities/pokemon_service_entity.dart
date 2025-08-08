import 'package:pokedex_app/features/pokemon/domain/entities/sprites/pokemon_sprites_entity.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/types/pokemon_types_entity.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/abilities/pokemon_abilities_entity.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/stats/pokemon_stats_entity.dart';

class PokemonServiceEntity {
  final int id;
  final String name;
  final int height;
  final int weight;
  final PokemonTypesEntity types;
  final PokemonSpritesEntity sprites;
  final PokemonAbilitiesEntity abilities;
  final PokemonStatsEntity stats;

  const PokemonServiceEntity({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.sprites,
    required this.abilities,
    required this.stats,
  });
}