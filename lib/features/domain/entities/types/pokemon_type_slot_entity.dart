import 'package:pokedex_app/features/domain/entities/types/pokemon_type_entity.dart';

class PokemonTypeSlotEntity {
  final int slot;
  final PokemonTypeEntity type;

  const PokemonTypeSlotEntity({
    required this.slot,
    required this.type,
  });
}