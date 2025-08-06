import 'package:pokedex_app/features/pokemon/domain/entities/sprites/pokemon_other_sprites_entity.dart';
import 'package:pokedex_app/features/pokemon/infraestructure/mappers/sprites/pokemon_official_artwork_mapper.dart';

class PokemonOtherSpritesMapper {
  static PokemonOtherSpritesEntity fromJson(Map<String, dynamic> json) {
    return PokemonOtherSpritesEntity(
      officialArtwork: json['official-artwork'] != null
          ? PokemonOfficialArtworkMapper.fromJson(json['official-artwork'] as Map<String, dynamic>)
          : null,
    );
  }

  static Map<String, dynamic> toJson(PokemonOtherSpritesEntity entity) {
    return {
      if(entity.officialArtwork != null)
      'official-artwork': PokemonOfficialArtworkMapper.toJson(entity.officialArtwork!),
    };
  }
}