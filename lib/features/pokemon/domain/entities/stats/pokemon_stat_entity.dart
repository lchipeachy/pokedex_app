class PokemonStatEntity {
  final int baseStat;
  final int effort;
  final StatEntity stat;

  const PokemonStatEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}

class StatEntity {
  final String name;
  final String url;

  const StatEntity({
    required this.name,
    required this.url,
  });
}
