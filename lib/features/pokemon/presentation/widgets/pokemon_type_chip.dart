import 'package:flutter/material.dart';

class PokemonTypeChip extends StatelessWidget {
  final String type;
  
  const PokemonTypeChip({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    
    // Definir colores según el tipo
    Color getTypeColor() {
      switch (type.toLowerCase()) {
        case 'grama':
          return const Color(0xFF63BC5A);
        case 'fuego':
          return const Color(0xFFFF9D55);
        case 'agua':
          return const Color(0xFF5090D6);
        case 'eléctrico':
          return const Color(0xFFF4D23C);
        case 'venenoso':
          return const Color(0xFFB567CE);
        default:
          return const Color(0xFF63BC5A);
      }
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: getTypeColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type,
        style: textStyle.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}