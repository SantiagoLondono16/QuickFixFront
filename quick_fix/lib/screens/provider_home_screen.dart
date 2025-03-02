import 'package:flutter/material.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panel de Proveedor"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
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
                  ServiceRequestCard(clientName: "Carlos López", service: "Reparación de tuberías"),
                  ServiceRequestCard(clientName: "Ana Martínez", service: "Instalación de aire acondicionado"),
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
                  ActiveServiceCard(clientName: "Roberto García", service: "Revisión eléctrica", status: "En progreso"),
                  ActiveServiceCard(clientName: "María Pérez", service: "Pintura de habitación", status: "Pendiente"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Solicitudes"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Mis Trabajos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
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
      elevation: 3,
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
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.green),
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
