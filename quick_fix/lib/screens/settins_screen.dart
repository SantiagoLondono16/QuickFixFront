import 'package:flutter/material.dart';
import 'package:quick_fix/widgets/custom_bottom_navigation_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
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
                  "John Doe",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Opciones de configuración
          _buildSettingsOption(
            context,
            title: "My Services",
            icon: Icons.build,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Messages",
            icon: Icons.message,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Notifications",
            icon: Icons.notifications,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Help",
            icon: Icons.help_outline,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Language",
            icon: Icons.language,
            onTap: () {},
          ),
          _buildSettingsOption(
            context,
            title: "Privacy & Security",
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
              child: const Text("Logout"),
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
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged out successfully")),
              );
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
