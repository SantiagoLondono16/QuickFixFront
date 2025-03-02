import 'package:flutter/material.dart';
import 'package:quick_fix/widgets/custom_bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuraciones"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Avatar del usuario
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child:
                      const Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Juan Ramirez",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Opciones de configuración
          _buildSettingsOption(
            context,
            title: "Mis Servicios",
            icon: Icons.build,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Chat",
            icon: Icons.message,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Notificationes",
            icon: Icons.notifications,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Ayuda",
            icon: Icons.help_outline,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Idioma",
            icon: Icons.language,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Privacidad y Seguridad",
            icon: Icons.lock,
            onTap: () {},
          ),
          const SizedBox(height: 20),

          // Botón para cerrar sesión
          Center(
            child: ElevatedButton(
              onPressed: () {
                _logout(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Cerrar Sesion"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }

  // Widget para opciones de configuración
  Widget _buildSettingsOption(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // Función para cerrar sesión
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Cerrar Sesion"),
        content: const Text("Estas seguro de que quieres Cerrar tu Perfil"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              GoRouter.of(context).go('/');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cerrado Correctamente")),
              );
            },
            child: const Text("Cerrar", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
