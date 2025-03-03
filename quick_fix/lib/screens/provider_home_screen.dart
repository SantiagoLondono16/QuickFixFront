import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_fix/widgets/provider_custom-bottom_navigation.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/Logo.jpg", // Reemplaza con la ruta correcta
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Quick ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Fix',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
  onPressed: () {
    GoRouter.of(context).go('/notifications');
  },
  icon: const Icon(Icons.notifications, color: Colors.white),
),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Solicitudes Recientes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ServiceRequestCard(
                      clientName: "Carlos López",
                      service: "Reparación de tuberías"),
                  ServiceRequestCard(
                      clientName: "Ana Martínez",
                      service: "Instalación de aire acondicionado"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Mis Trabajos Activos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ActiveServiceCard(
                      clientName: "Roberto García",
                      service: "Revisión eléctrica",
                      status: "En progreso"),
                  ActiveServiceCard(
                      clientName: "María Pérez",
                      service: "Pintura de habitación",
                      status: "Pendiente"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const ProviderCustomBottomNavigationBar(currentIndex: 0),
    );
  }
}

// Tarjeta para mostrar solicitudes de clientes
class ServiceRequestCard extends StatelessWidget {
  final String clientName;
  final String service;

  const ServiceRequestCard({
    required this.clientName,
    required this.service,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: const Icon(Icons.handyman, color: Colors.blue),
        title: Text(clientName),
        subtitle: Text(service),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text("Aceptar"),
        ),
      ),
    );
  }
}

// Tarjeta para mostrar los trabajos activos del proveedor
class ActiveServiceCard extends StatelessWidget {
  final String clientName;
  final String service;
  final String status;

  const ActiveServiceCard({
    required this.clientName,
    required this.service,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.blue),
        title: Text(clientName),
        subtitle: Text(service),
        trailing: Text(
          status,
          style: TextStyle(
            color: status == "En progreso" ? Colors.orange : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
