import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonTypeChip extends StatelessWidget {
  final String type;
  const PokemonTypeChip({super.key, required this.type});

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
      case 'venenoso':
        return 'venenoso';
      case 'volador':
        return 'volador';
      default:
        return 'normal'; 
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
      case 'venenoso':
        return const Color(0xFFB567CE);
      case 'volador':
        return const Color(0xFF89AAE3);
      default:
        return const Color(0xFF919AA2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: _getPrincipalColor(type),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset('assets/pokemons_types_chips/${_getIconType(type)}.svg',
                width: 11,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            type,
            style: textStyle.bodyMedium?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}