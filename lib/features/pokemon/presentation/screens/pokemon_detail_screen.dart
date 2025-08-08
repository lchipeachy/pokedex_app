import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_service_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/favorite_pokemons/favorites_provider.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_type_chip.dart';

class PokemonDetailScreen extends ConsumerStatefulWidget {
  final PokemonServiceEntity pokemon;
  
  const PokemonDetailScreen({
    super.key, 
    required this.pokemon,
  });

  @override
  ConsumerState<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends ConsumerState<PokemonDetailScreen> {
  String get _primaryType {
    if (widget.pokemon.types.types.isEmpty) return 'normal';
    return widget.pokemon.types.types.first.type.name;
  }

  String get _pokemonImage {
    final officialArtWork = widget.pokemon.sprites.other?.officialArtwork?.frontDefault;
    if (officialArtWork != null && officialArtWork.isNotEmpty) {
      return officialArtWork;
    }
    return widget.pokemon.sprites.frontDefault;
  }

  String _translateType(String englishType) {
    switch (englishType.toLowerCase()) {
      case 'grass':
        return 'hoja';
      case 'fire':
        return 'fuego';
      case 'water':
        return 'agua';
      case 'electric':
        return 'eléctrico';
      case 'poison':
        return 'venenoso';
      case 'flying':
        return 'volador';
      case 'bug':
        return 'bug';
      case 'normal':
        return 'normal';
      default:
        return englishType;
    }
  }

  String _getIconType(String type) {
    switch (type.toLowerCase()) {
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
      case 'bug':
        return 'bug';
      default:
        return 'normal';
    }
  }

  String _translateAbilityName(String englishName) {
    switch (englishName.toLowerCase()) {
      case 'overgrow':
        return 'Espesura';
      case 'chlorophyll':
        return 'Clorofila';
      case 'blaze':
        return 'Mar Llamas';
      case 'solar-power':
        return 'Poder Solar';
      case 'torrent':
        return 'Torrente';
      case 'rain-dish':
        return 'Cura Lluvia';
      case 'static':
        return 'Electricidad Estática';
      case 'lightning-rod':
        return 'Pararrayos';
      case 'shield-dust':
        return 'Polvo Escudo';
      case 'run-away':
        return 'Fuga';
      case 'shed-skin':
        return 'Mudar';
      case 'compound-eyes':
        return 'Ojo Compuesto';
      case 'swarm':
        return 'Enjambre';
      case 'keen-eye':
        return 'Vista Lince';
      case 'tangled-feet':
        return 'Tumbos';
      case 'big-pecks':
        return 'Sacapecho';
      case 'pickup':
        return 'Recogida';
      case 'technician':
        return 'Experto';
      case 'unnerve':
        return 'Nerviosismo';
      case 'clear-body':
        return 'Cuerpo Puro';
      case 'natural-cure':
        return 'Cura Natural';
      case 'serene-grace':
        return 'Dicha';
      case 'early-bird':
        return 'Madrugador';
      case 'scrappy':
        return 'Intrépido';
      case 'thick-fat':
        return 'Sebo';
      case 'hydration':
        return 'Hidratación';
      case 'shell-armor':
        return 'Armadura Batalla';
      case 'skill-link':
        return 'Encadenado';
      case 'overcoat':
        return 'Funda';
      case 'infiltrator':
        return 'Allanamiento';
      case 'stench':
        return 'Hedor';
      case 'damp':
        return 'Humedad';
      case 'cloud-nine':
        return 'Aclimatación';
      case 'vital-spirit':
        return 'Espíritu Vital';
      case 'angler-point':
        return 'Señuelo';
      case 'ice-body':
        return 'Corpo Helado';
      case 'oblivious':
        return 'Despiste';
      case 'own-tempo':
        return 'Ritmo Propio';
      case 'suction-cups':
        return 'Ventosas';
      case 'intimidate':
        return 'Intimidación';
      case 'arena-trap':
        return 'Trampa Arena';
      case 'sand-veil':
        return 'Velo Arena';
      case 'pressure':
        return 'Presión';
      case 'inner-focus':
        return 'Foco Interno';
      case 'insomnia':
        return 'Insomnio';
      case 'color-change':
        return 'Cambio Color';
      case 'immunity':
        return 'Inmunidad';
      case 'flash-fire':
        return 'Absorbe Fuego';
      case 'shield-dust':
        return 'Polvo Escudo';
      case 'own-tempo':
        return 'Ritmo Propio';
      case 'magic-guard':
        return 'Muro Mágico';
      case 'clear-body':
        return 'Cuerpo Puro';
      case 'natural-cure':
        return 'Cura Natural';
      case 'serene-grace':
        return 'Dicha';
      case 'early-bird':
        return 'Madrugador';
      case 'scrappy':
        return 'Intrépido';
      case 'thick-fat':
        return 'Sebo';
      case 'hydration':
        return 'Hidratación';
      case 'shell-armor':
        return 'Armadura Batalla';
      case 'skill-link':
        return 'Encadenado';
      case 'overcoat':
        return 'Funda';
      case 'infiltrator':
        return 'Allanamiento';
      default:
        return englishName.replaceAll('-', ' ').split(' ').map((word) => 
          word[0].toUpperCase() + word.substring(1).toLowerCase()
        ).join(' ');
    }
  }

  String _translateStatName(String englishName) {
    switch (englishName.toLowerCase()) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'Ataque';
      case 'defense':
        return 'Defensa';
      case 'special-attack':
        return 'Ataque Especial';
      case 'special-defense':
        return 'Defensa Especial';
      case 'speed':
        return 'Velocidad';
      default:
        return englishName.replaceAll('-', ' ').split(' ').map((word) => 
          word[0].toUpperCase() + word.substring(1).toLowerCase()
        ).join(' ');
    }
  }

  Color _getBackgroundColor(String type) {
    switch (type.toLowerCase()) {
      case 'hoja':
        return const Color(0xFFEDF6EC);
      case 'fuego':
        return const Color(0xFFFCF3EB);
      case 'agua':
        return const Color(0xFFEBF1F8);
      case 'eléctrico':
        return const Color(0xFFFBF8E9);
      case 'venenoso':
        return const Color(0xFFF5F0F8);
      case 'volador':
        return const Color(0xFFF0F8FF);
      case 'bug':
        return const Color(0xFFF0F8E8);
      default:
        return const Color(0xFFF1F2F3);
    }
  }

  Color _getPrincipalColor(String type) {
    switch (type.toLowerCase()) {
      case 'hoja':
        return const Color(0xFF63BC5A);
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
      case 'bug':
        return const Color(0xFF92BC2C);
      default:
        return const Color(0xFF919AA2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final pokemon = widget.pokemon;
    final isFavorite = ref.watch(isFavoriteProvider(pokemon.id));

    return Scaffold(
      backgroundColor: _getBackgroundColor(_translateType(_primaryType)),
      body: CustomScrollView(
        slivers: [
          // App Bar personalizado
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: _getPrincipalColor(_translateType(_primaryType)),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Fondo con patrón SVG
                  Positioned.fill(
                    child: SvgPicture.asset(
                      'assets/pokemons_types/${_translateType(_primaryType)}.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Imagen del Pokémon
                  Center(
                    child: Image.network(
                      _pokemonImage,
                      height: 250,
                      width: 250,
                    ),
                  ),
                  // Botón de favorito
                  Positioned(
                    top: 50,
                    right: 20,
                    child: GestureDetector(
                      onTap: () async {
                        await ref.read(favoritesProvider.notifier).toggleFavorites(pokemon.id);
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isFavorite
                                  ? '${pokemon.name} eliminado de favoritos'
                                  : '${pokemon.name} agregado a favoritos',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          // Contenido principal
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre y número del Pokémon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            pokemon.name.toUpperCase(),
                            style: textStyle.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          '#${pokemon.id.toString().padLeft(3, '0')}',
                          style: textStyle.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _getPrincipalColor(_translateType(_primaryType)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Tipos del Pokémon
                    Text(
                      'Tipos',
                      style: textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: pokemon.types.types.map((typeSlot) {
                        return PokemonTypeChip(
                          type: _translateType(typeSlot.type.name),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                    
                    // Sección de habilidades
                    Text(
                      'Habilidades',
                      style: textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildAbilitiesSection(),
                    const SizedBox(height: 24),
                    
                    // Sección de estadísticas
                    Text(
                      'Estadísticas',
                      style: textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStatsSection(),
                    const SizedBox(height: 24),
                    
                    // Sección de información adicional
                    Text(
                      'Información',
                      style: textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbilitiesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: widget.pokemon.abilities.abilities.asMap().entries.map((entry) {
          final ability = entry.value;
          final index = entry.key;
          
          return Column(
            children: [
              _buildAbilityRow(
                _translateAbilityName(ability.ability.name),
                'assets/habilities/${_getIconType(_translateType(_primaryType))}_h.svg',
                ability.isHidden,
              ),
              if (index < widget.pokemon.abilities.abilities.length - 1)
                const SizedBox(height: 12),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAbilityRow(String abilityName, String iconPath, bool isHidden) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                abilityName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isHidden)
                Text(
                  '(Habilidad Oculta)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isHidden ? Colors.orange : _getPrincipalColor(_translateType(_primaryType)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            isHidden ? 'Oculta' : 'Normal',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: widget.pokemon.stats.stats.asMap().entries.map((entry) {
          final stat = entry.value;
          final index = entry.key;
          
          return Column(
            children: [
              _buildStatRow(
                _translateStatName(stat.stat.name),
                stat.baseStat / 255.0, // Normalizar a 0-1
                stat.baseStat,
              ),
              if (index < widget.pokemon.stats.stats.length - 1)
                const SizedBox(height: 12),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatRow(String statName, double value, int baseStat) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            statName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              _getPrincipalColor(_translateType(_primaryType)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '$baseStat',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          _buildInfoRow('Altura', '${widget.pokemon.height / 10} m'),
          const SizedBox(height: 12),
          _buildInfoRow('Peso', '${widget.pokemon.weight / 10} kg'),
          const SizedBox(height: 12),
          _buildInfoRow('Categoría', 'Pokémon ${_translateType(_primaryType)}'),
          const SizedBox(height: 12),
          _buildInfoRow('Habilidades', '${widget.pokemon.abilities.abilities.length}'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
