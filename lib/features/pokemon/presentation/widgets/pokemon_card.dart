import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_type_chip.dart';

class PokemonCard extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final List<String> types;
  final String backgroundColor;
  final String typeIcon;
  
  const PokemonCard({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.backgroundColor,
    required this.typeIcon,
  });

  // Función para obtener el color de fondo 
  Color getCardBackgroundColor() {
    final primaryType = types.first.toLowerCase();
    
    switch (primaryType) {
      case 'grama':
        return const Color(0xFFEDF6EC);
      case 'fuego':
        return const Color(0xFFFCF3EB);
      case 'agua':
        return const Color(0xFFEBF1F8);
      case 'eléctrico':
        return const Color(0xFFFBF8E9);
      default:
        return const Color(0xFFEDF6EC);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final bgColor = Color(int.parse(backgroundColor));
    
    return Container(
      decoration: BoxDecoration(
        color: getCardBackgroundColor(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    Text(
                      'N°$id',
                      style: textStyle.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      name,
                      style: textStyle.bodyMedium?.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: types.map((type) => 
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: PokemonTypeChip(type: type),
                        )
                      ).toList(),
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
                      color: bgColor,
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(typeIcon),
                        ),
                        Center(
                          child: Image.asset(
                            image, 
                            height: 94, 
                            width: 94
                          ),
                        ),
                      ],
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