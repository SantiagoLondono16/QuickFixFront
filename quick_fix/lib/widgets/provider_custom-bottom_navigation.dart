import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProviderCustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const ProviderCustomBottomNavigationBar(
      {required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Solicitudes"),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: "Mis Trabajos"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
      onTap: (index) {
        if (index == 0) {
          context.go('/provider-home');
        } else if (index == 3) {
          context.go('/provider-settings');
        }
      },
    );
  }
}
