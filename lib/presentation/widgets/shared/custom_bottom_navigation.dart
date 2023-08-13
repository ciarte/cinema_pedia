import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.label_important_outline_rounded),
        label: 'Categorias',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined),
        label: 'Favoritos',
      ),
    ]);
  }
}
