import 'package:pokedex_app/features/pokemon/domain/entities/abilities/pokemon_abilities_entity.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/abilities/pokemon_ability_entity.dart';

class PokemonAbilitiesMapper {
  static PokemonAbilitiesEntity fromJson(Map<String, dynamic> json) {
    final abilitiesList = json['abilities'] as List<dynamic>;
    
    final abilities = abilitiesList.map((abilityJson) {
      return PokemonAbilityMapper.fromJson(abilityJson);
    }).toList();

    return PokemonAbilitiesEntity(abilities: abilities);
  }
}

class PokemonAbilityMapper {
  static PokemonAbilityEntity fromJson(Map<String, dynamic> json) {
    return PokemonAbilityEntity(
      isHidden: json['is_hidden'] ?? false,
      slot: json['slot'] ?? 0,
      ability: AbilityMapper.fromJson(json['ability']),
    );
  }
}

class AbilityMapper {
  static AbilityEntity fromJson(Map<String, dynamic> json) {
    return AbilityEntity(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
