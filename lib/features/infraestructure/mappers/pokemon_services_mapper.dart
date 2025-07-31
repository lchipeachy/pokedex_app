import 'package:pokedex_app/features/domain/entities/pokemon_service_entity.dart';
import 'package:pokedex_app/features/infraestructure/mappers/types/pokemon_types_mapper.dart';
import 'package:pokedex_app/features/infraestructure/mappers/sprites/pokemon_sprites_mapper.dart';

class PokemonServiceMapper {
  static PokemonServiceEntity fromJson(Map<String, dynamic> json) {
    return PokemonServiceEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      types: PokemonTypesMapper.fromJson(json['types'] as Map<String, dynamic>),
      sprites: PokemonSpritesMapper.fromJson(json['sprites'] as Map<String, dynamic>),
    );
  }

  static Map<String, dynamic> toJson(PokemonServiceEntity entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'types': PokemonTypesMapper.toJson(entity.types),
      'sprites': PokemonSpritesMapper.toJson(entity.sprites),
    };
  }
}
