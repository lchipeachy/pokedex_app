import 'package:pokedex_app/features/pokemon/domain/entities/sprites/pokemon_sprites_entity.dart';
import 'package:pokedex_app/features/pokemon/infraestructure/mappers/sprites/pokemon_other_sprites_mapper.dart';

class PokemonSpritesMapper {
  static PokemonSpritesEntity fromJson(Map<String, dynamic> json) {
    return PokemonSpritesEntity(
      frontDefault: json['front_default'] as String,
      other: json['other'] != null
          ? PokemonOtherSpritesMapper.fromJson(json['other'] as Map<String, dynamic>)
          : null,
    );
  }

  static Map<String, dynamic> toJson(PokemonSpritesEntity entity) {
    return {
      'front_default': entity.frontDefault,
      if(entity.other != null)
        'other': PokemonOtherSpritesMapper.toJson(entity.other!),
    };
  }
}