import 'package:flutter/material.dart';

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF63BC5A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            'Grama',
            style: textStyle.bodyMedium,
          ),
        ],
      ),
    );
  }
}