import 'package:pokedex_app/features/domain/entities/sprites/pokemon_other_sprites_entity.dart';

class PokemonSpritesEntity{
  final String frontDefault;
  final PokemonOtherSpritesEntity? other;

  const PokemonSpritesEntity({
    required this.frontDefault,
    this.other,
  });
}