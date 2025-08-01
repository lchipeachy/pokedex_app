import 'package:flutter/material.dart';

class TypeFilterBottomSheet extends StatelessWidget {
  final Function(String) onTypeSelected;

  const TypeFilterBottomSheet({
    super.key,
    required this.onTypeSelected,
  });

  Color _getBackgroundColor() {
    return Colors.white;
  }



  List<Widget> _buildTypeButtons(BuildContext context) {
    return [
      _buildTypeButton('Todos los tipos', _getTypeColor('Todos los tipos'), onTap: () {
        onTypeSelected('Todos los tipos');
        Navigator.pop(context);
      }),
      _buildTypeButton('Agua', _getTypeColor('Agua')),
      _buildTypeButton('Dragón', _getTypeColor('Dragón')),
      _buildTypeButton('Eléctrico', _getTypeColor('Eléctrico')),
      _buildTypeButton('Hada', _getTypeColor('Hada')),
      _buildTypeButton('Fantasma', _getTypeColor('Fantasma')),
      _buildTypeButton('Fuego', _getTypeColor('Fuego')),
      _buildTypeButton('Hielo', _getTypeColor('Hielo')),
      _buildTypeButton('Hoja', _getTypeColor('Hoja')),
      _buildTypeButton('Insecto', _getTypeColor('Insecto')),
      _buildTypeButton('Combatiente', _getTypeColor('Combatiente')),
      _buildTypeButton('Normal', _getTypeColor('Normal')),
      _buildTypeButton('Nocturno', _getTypeColor('Nocturno')),
      _buildTypeButton('Metal', _getTypeColor('Metal')),
      _buildTypeButton('Piedra', _getTypeColor('Piedra')),
      _buildTypeButton('Psíquico', _getTypeColor('Psíquico')),
      _buildTypeButton('Terrestre', _getTypeColor('Terrestre')),
      _buildTypeButton('Venenoso', _getTypeColor('Venenoso')),
      _buildTypeButton('Volador', _getTypeColor('Volador')),
    ];
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Todos los tipos':
        return const Color(0xFF333333);
      case 'Agua':
        return const Color(0xFF5090D6);
      case 'Dragón':
        return const Color(0xFF0B6DC3);
      case 'Eléctrico':
        return const Color(0xFFF4D23C);
      case 'Hada':
        return const Color(0xFFEC8FE6);
      case 'Fantasma':
        return const Color(0xFF5269AD);
      case 'Fuego':
        return const Color(0xFFFF9D55);
      case 'Hielo':
        return const Color(0xFF73CEC0);
      case 'Hoja':
        return const Color(0xFF63BC5A);
      case 'Insecto':
        return const Color(0xFF91C12F);
      case 'Combatiente':
        return const Color(0xFFCE416B);
      case 'Normal':
        return const Color(0xFF919AA2);
      case 'Nocturno':
        return const Color(0xFF5A5465);
      case 'Metal':
        return const Color(0xFF5A8EA2);
      case 'Piedra':
        return const Color(0xFFC5B78C);
      case 'Psíquico':
        return const Color(0xFFFA7179);
      case 'Terrestre':
        return const Color(0xFFD97845);
      case 'Venenoso':
        return const Color(0xFFB567CE);
      case 'Volador':
        return const Color(0xFF89AAE3);
      default:
        return const Color(0xFF919AA2);
    }
  }

  Color _getTextColor(Color backgroundColor) {
    // Solo estos tipos específicos tienen texto blanco
    final whiteTextTypes = ['Todos los tipos', 'Nocturno', 'Fantasma', 'Dragón'];
    
    // Busca el tipo actual comparando el color de fondo
    for (String type in whiteTextTypes) {
      if (backgroundColor == _getTypeColor(type)) {
        return Colors.white;
      }
    }
    
    // Para todos los demás tipos, usa texto negro
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    
    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Draggable indicator
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              children: [
                Center(
                  child: Text(
                    'Selecciona un tipo',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Types Grid
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: _buildTypeButtons(context),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTypeButton(String type, Color color, {VoidCallback? onTap}) {
    return Builder(
      builder: (context) {
        final textStyle = Theme.of(context).textTheme;
        
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap ?? () {
                onTypeSelected(type);
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(49),
                ),
                child: Text(
                  type,
                  style: textStyle.bodyLarge?.copyWith(
                    color: _getTextColor(color),
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  
} 