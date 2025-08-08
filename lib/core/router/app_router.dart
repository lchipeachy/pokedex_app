import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/core/widgets/main_layout.dart';
import 'package:pokedex_app/features/pokemon/presentation/screens/pokemon_favorite_list_screen.dart';
import 'package:pokedex_app/features/pokemon/presentation/screens/pokemon_list_screen.dart';
import 'package:pokedex_app/features/pokemon/presentation/screens/pokemon_detail_screen.dart';
import 'package:pokedex_app/features/shared/screens/error_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child){
          return MainLayout(child: child);
        },
        routes: 
        [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const PokemonListScreen(),
            routes: [
              GoRoute(
                path: 'detail',
                name: 'detail',
                builder: (context, state) {
                  final pokemon = state.extra as dynamic;
                  return PokemonDetailScreen(pokemon: pokemon);
                },
              ),
            ],
          ),

          GoRoute(
            path: '/favorites',
            name: 'favorites',
            builder: (context, state) => const PokemonFavoriteListScreen(),
            routes: const [],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
});