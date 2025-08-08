class PokemonAbilityEntity {
  final bool isHidden;
  final int slot;
  final AbilityEntity ability;

  const PokemonAbilityEntity({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });
}

class AbilityEntity {
  final String name;
  final String url;

  const AbilityEntity({
    required this.name,
    required this.url,
  });
}
