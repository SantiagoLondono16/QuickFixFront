import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: "Mis Servicios"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
      onTap: (index) {
        if (index == 1) {
          context.go('/history');
        } else if (index == 2) {
          context.go('/settings-profile');
        } else if (index == 0) {
          context.go('/home');
        }
      },
    );
  }
}
