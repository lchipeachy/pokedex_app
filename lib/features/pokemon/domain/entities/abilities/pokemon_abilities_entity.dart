import 'package:pokedex_app/features/pokemon/domain/entities/abilities/pokemon_ability_entity.dart';

class PokemonAbilitiesEntity {
  final List<PokemonAbilityEntity> abilities;

  const PokemonAbilitiesEntity({
    required this.abilities,
  });
}
