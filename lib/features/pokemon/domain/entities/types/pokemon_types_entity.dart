import 'package:pokedex_app/features/pokemon/domain/entities/types/pokemon_type_slot_entity.dart';

class PokemonTypesEntity {
  final List<PokemonTypeSlotEntity> types;

  const PokemonTypesEntity({
    required this.types,
  });
}