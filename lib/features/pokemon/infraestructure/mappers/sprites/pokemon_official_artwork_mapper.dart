import 'package:pokedex_app/features/pokemon/domain/entities/sprites/pokemon_official_artwork_sprites_entity.dart';

class PokemonOfficialArtworkMapper {
  static PokemonOfficialArtworkEntity fromJson(Map<String, dynamic> json) {
    return PokemonOfficialArtworkEntity(
      frontDefault: json['front_default'] as String
    );
  }
  static Map<String, dynamic> toJson(PokemonOfficialArtworkEntity entity) {
    return {
      'front_default': entity.frontDefault
    };
  }
} 