import 'package:pokedex_app/features/domain/entities/types/pokemon_types_entity.dart';
import 'package:pokedex_app/features/infraestructure/mappers/types/pokemon_type_slot_mapper.dart';

class PokemonTypesMapper {
  static PokemonTypesEntity fromJson(Map<String, dynamic> json) {
    return PokemonTypesEntity(
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeSlotMapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  static Map<String, dynamic> toJson(PokemonTypesEntity entity) {
    return {
      'types': entity.types.map((e) => PokemonTypeSlotMapper.toJson(e)).toList(),
    };
  }
}
