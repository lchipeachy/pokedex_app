import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/features/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/presentation/widgets/pokemon_type_chip.dart';

class PokemonCard extends StatefulWidget {
  final PokemonEntity pokemon;  
  const PokemonCard({super.key, required this.pokemon});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  bool isFavorite = false;
  String _getIconType(String type) {
    switch(type.toLowerCase()){
      case 'hoja':
        return 'hoja';
      case 'fuego':
        return 'fuego';
      case 'agua':
        return 'agua';
      case 'eléctrico':
        return 'electrico';
      default:
        return 'normal'; 
    }
  }

  Color _getBackgroundColor(String type) {
    switch(type.toLowerCase()){
      case 'hoja':
        return const Color(0XFFEDF6EC);
      case 'fuego':
        return const Color(0xFFFCF3EB);
      case 'agua':
        return const Color(0xFFEBF1F8);
      case 'eléctrico':
        return const Color(0xFFFBF8E9);
      default:
        return const Color(0xFFF1F2F3);
    }
  }

  Color _getPrincipalColor(String type) {
    switch(type.toLowerCase()){
      case 'hoja':
        return const Color(0XFF63BC5A);
      case 'fuego':
        return const Color(0xFFFF9D55);
      case 'agua':
        return const Color(0xFF5090D6);
      case 'eléctrico':
        return const Color(0xFFF4D23C);
      default:
        return const Color(0xFF919AA2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final pokemon = widget.pokemon;
  
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: _getBackgroundColor(pokemon.types[0]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      'N°${pokemon.id}',
                      style: textStyle.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pokemon.name,
                      style: textStyle.bodyMedium?.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: pokemon.types.map((type) {
                        return PokemonTypeChip(
                          type: type,
                        );
                      }).toList()
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: _getPrincipalColor(pokemon.types[0]),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(
                            'assets/pokemons_types/${_getIconType(pokemon.types[0])}.svg'
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            pokemon.image, 
                            height: 94, 
                            width: 94
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border, 
                            color: isFavorite ? Colors.red : Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}