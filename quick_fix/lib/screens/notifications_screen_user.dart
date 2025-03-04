import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreenUser extends StatelessWidget {
  const NotificationsScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        "title": "Servicio Aceptado",
        "message": "El proveedor Camilo ha aceptado tu solicitud."
      },
      {
        "title": "Recordatorio",
        "message": "Tienes un servicio agendado para mañana a las 9:00 AM."
      },
      {
        "title": "Pago realizado",
        "message": "Tu pago de \$120,000 ha sido procesado correctamente."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notificaciones",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/home');
            },
          ),
        ],
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
