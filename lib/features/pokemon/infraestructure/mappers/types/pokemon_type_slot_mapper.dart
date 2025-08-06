import 'package:pokedex_app/features/pokemon/domain/entities/types/pokemon_type_slot_entity.dart';
import 'package:pokedex_app/features/pokemon/infraestructure/mappers/types/pokemon_type_mapper.dart';

class PokemonTypeSlotMapper {
  static PokemonTypeSlotEntity fromJson(Map<String, dynamic> json) {
    return PokemonTypeSlotEntity(
      slot: json['slot'] as int,
      type: PokemonTypeMapper.fromJson(json['type'] as Map<String, dynamic>),
    );
  }

  static Map<String, dynamic> toJson(PokemonTypeSlotEntity entity) {
    return {
      'slot': entity.slot,
      'type': PokemonTypeMapper.toJson(entity.type),
    };
  }
}
