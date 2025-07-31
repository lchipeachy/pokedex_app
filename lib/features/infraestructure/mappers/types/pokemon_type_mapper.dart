import 'package:pokedex_app/features/domain/entities/types/pokemon_type_entity.dart';

class PokemonTypeMapper {
  static PokemonTypeEntity fromJson(Map<String, dynamic> json) {
    return PokemonTypeEntity(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  static Map<String, dynamic> toJson(PokemonTypeEntity entity) {
    return {
      'name': entity.name,
      'url': entity.url,
    };
  }
}