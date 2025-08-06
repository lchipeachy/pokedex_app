import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/core/widgets/pokedex_bottom_navbar.dart';
import 'package:pokedex_app/features/shared/providers/loading/loading_provider.dart';
import 'package:pokedex_app/features/shared/widgets/loading_widget.dart';

class MainLayout extends ConsumerStatefulWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(loadingProvider);
    return Stack(
      children: [
        Scaffold(
          body: widget.child,
          bottomNavigationBar: const PokedexBottomNavbar(),
        ),
        if (isLoading)
          const LoadingWidget(),
      ],
    );
  }
}
