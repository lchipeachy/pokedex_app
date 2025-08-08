import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PokedexBottomNavbar extends StatelessWidget {
  const PokedexBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          //! # -> 0xFF
          color: Colors.white
        )
      ]),
      child: BottomNavigationBar(currentIndex: _calculateSelectedIndex(currentLocation),
      onTap: (index) => _onTapItem(context, index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF173EA5),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: _buildIconBar('home_inactive'),
          activeIcon: _buildIconBar('home_active'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIconBar('search_inactive'),
          activeIcon: _buildIconBar('search_active'),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: _buildIconBar('favorites_inactive'),
          activeIcon: _buildIconBar('favorites_active'),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: _buildIconBar('profile_inactive'),
          activeIcon: _buildIconBar('profile_active'),
          label: 'Perfil',
        ),
      ]),
    );
  }

  Widget _buildIconBar(String icon) {
    final String iconPath = 'assets/nav_bar/';
    return SvgPicture.asset('${iconPath + icon }.svg');
  }

  int _calculateSelectedIndex(String location) {
    if (location == '/') return 0;
    if (location == '/favorites') return 2;
    return 0; 
  } 

  void _onTapItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/');
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/favorites');
      break;
      case 3:
        context.go('/profile');
      break;
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pantalla en desarrollo'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}

