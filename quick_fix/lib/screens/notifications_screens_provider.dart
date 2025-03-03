import 'package:flutter/material.dart';

class NotificationsScreensProvider extends StatelessWidget {
  const NotificationsScreensProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {"title": "Nuevo servicio asignado", "message": "Has recibido un nuevo trabajo de plomería."},
      {"title": "Recordatorio", "message": "Tienes un trabajo programado para mañana a las 10:00 AM."},
      {"title": "Pago recibido", "message": "Has recibido un pago de \$100,000."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notificaciones",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Negrita
            fontSize: 22, // Tamaño más grande
            color: Colors.white, // Color blanco
            fontFamily: 'Roboto', // Fuente personalizada
          ),
        ),
        backgroundColor: Colors.blue, // Color de la barra
        centerTitle: true, // Centrar título
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.blue),
              title: Text(
                notifications[index]["title"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(notifications[index]["message"]!),
            ),
          );
        },
      ),
    );
  }
}
