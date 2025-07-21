import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/core/widgets/main_layout.dart';
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
            builder: (context, state) => const SizedBox.shrink()
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
});