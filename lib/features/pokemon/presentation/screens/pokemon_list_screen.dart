import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:pokedex_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/features/pokemon/presentation/providers/pokemon_provider.dart';
import 'package:pokedex_app/features/shared/providers/loading/loading_provider.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/pokemon_card.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/search_bar_widget.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/filter_button_widget.dart';
import 'package:pokedex_app/features/pokemon/presentation/widgets/type_filter_bottom_sheet.dart';

/*
ref.watch()

ref.read()
*/

class PokemonListScreen extends ConsumerStatefulWidget {
  const PokemonListScreen({super.key});

  @override
  ConsumerState<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends ConsumerState<PokemonListScreen> {
  final ScrollController _scrollController = ScrollController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getPokemonList();
    });
    _scrollController.addListener(_onScroll);
  }

  Future <void> getPokemonList() async{
    try {
      ref.read(loadingProvider.notifier).showLoading();
      await ref.read(pokemonProvider.notifier).getPokemonList();
    
      final pokemonList = ref.read(pokemonProvider).pokemonList;
      debugPrint('$pokemonList');
    } catch (e){
      debugPrint('Error: $e');
    } finally {
      if(mounted) {
        ref.read(loadingProvider.notifier).hideLoading();
      }
    }
  }

  void _onScroll() {
    if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(pokemonProvider.notifier).loadMorePokemon();
    }
  }

  //* Método para manejar la búsqueda
  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    
    // Crear un nuevo timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      ref.read(pokemonProvider.notifier).searchPokemon(query);
    });
  }

  //* Método para limpiar la búsqueda
  void _clearSearch() {
    _searchController.clear();
    ref.read(pokemonProvider.notifier).clearSearch();
  }

  final TextEditingController _searchController = TextEditingController();
  String _selectedType = 'Todos los tipos';
  String _selectedSort = 'Menor número';

  final List<PokemonEntity> pokemonList = [
    PokemonEntity(
      id: '001', 
      name: 'Bulbasaur', 
      types: ['Hoja', 'Venenoso'],
      image: 'assets/pokemons/bulbasaur.png', 
    ),
    PokemonEntity(
      id: '002', 
      name: 'Charizard', 
      types: ['Fuego', 'Volador'],
      image: 'assets/pokemons/charizard.png', 
    ),
    PokemonEntity(
      id: '003', 
      name: 'Pikachu', 
      types: ['Eléctrico'],
      image: 'assets/pokemons/pikachu.png', 
    ),
    PokemonEntity(
      id: '004', 
      name: 'Squirtle', 
      types: ['Agua'],
      image: 'assets/pokemons/squirtle.png', 
    )
  ];

  void _showTypeFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: TypeFilterBottomSheet(
            onTypeSelected: (String type) {
              setState(() {
                _selectedType = type;
              });
            },
          ),
        ),
      ),
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Draggable indicator
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          Container(
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: Text(
                'Selecciona una opción',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Sort options
          _buildSortOption('Menor número'),
          _buildSortOption('Mayor número'),
          _buildSortOption('A-Z'),
          _buildSortOption('Z-A'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSortOption(String option) {
    final textStyle = Theme.of(context).textTheme;
    
    return Builder(
      builder: (context) => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedSort = option;
              });
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(49),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF333333),
                borderRadius: BorderRadius.circular(49),
              ),
              child: Text(
                option,
                style: textStyle.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = ref.watch(pokemonProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            SearchBarWidget(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),
            
            // Filter Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  FilterButtonWidget(
                    text: _selectedType,
                    onTap: _showTypeFilterBottomSheet,
                  ),
                  const SizedBox(width: 12),
                  FilterButtonWidget(
                    text: _selectedSort,
                    onTap: _showSortBottomSheet,
                  ),
                ],
              ),
            ),
            
            // Pokemon List
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(pokemonProvider.notifier).refreshPokemonList();
                },
                child: Builder(builder: (context) {
                  //* Estado de carga inicial
                  // if (pokemonState.isLoading && pokemonState.pokemonList.isEmpty) {
                  //   return const LoadingWidget();
                  // }

                  //* Estado de búsqueda
                  if (pokemonState.isSearching) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Color(0xFFCD3131)),
                          SizedBox(height: 16),
                          Text('Buscando Pokémon...'),
                        ],
                      ),
                    );
                  }

                  //* Mostrar lista de Pokémon
                  final displayList = pokemonState.displayList;
                  
                  if(displayList.isEmpty && !pokemonState.isLoading) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            pokemonState.isInSearchMode 
                              ? 'No se encontraron Pokémon'
                              : 'No hay pokemons disponibles',
                            style: TextStyle(
                              fontSize: 18, 
                              color: Colors.grey[600],
                            ),
                          ),
                          if (pokemonState.isInSearchMode) ...[
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: _clearSearch,
                              child: const Text('Limpiar búsqueda'),
                            ),
                          ],
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: displayList.length + (pokemonState.isLoadingMore && !pokemonState.isInSearchMode ? 1 : 0),
                    itemBuilder: (context, index) {
                      if(index == displayList.length) {
                        return const Center(
                          child: CircularProgressIndicator(color: Color(0xFFCD3131)),
                        );
                      }
                      final pokemon = displayList[index];
                      return PokemonCard(
                        pokemon: pokemon,
                      );
                    },
                  );
                })
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}