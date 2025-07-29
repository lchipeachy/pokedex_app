import 'package:pokedex_app/features/domain/entities/sprites/pokemon_sprites_entity.dart';
import 'package:pokedex_app/features/domain/entities/types/pokemon_types_entity.dart';

class PokemonServiceEntity {
  final int id;
  final String name;
  final PokemonTypesEntity types;
  final PokemonSpritesEntity sprites;

  const PokemonServiceEntity({
    required this.id,
    required this.name,
    required this.types,
    required this.sprites,
  });
}