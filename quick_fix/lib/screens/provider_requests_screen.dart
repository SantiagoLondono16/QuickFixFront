import 'package:flutter/material.dart';
import 'package:quick_fix/widgets/provider_custom-bottom_navigation.dart';

class ProviderRequestsScreen extends StatelessWidget {
  const ProviderRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/Logo.jpg",
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
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Fix',
                    style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Solicitudes Pendientes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  _ServiceRequestCard(clientName: "Pedro Gómez", service: "Reparación de lavadora"),
                  _ServiceRequestCard(clientName: "Luisa Fernández", service: "Mantenimiento de aire acondicionado"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ProviderCustomBottomNavigationBar(currentIndex: 1),
    );
  }
}

class _ServiceRequestCard extends StatelessWidget {
  final String clientName;
  final String service;

  const _ServiceRequestCard({required this.clientName, required this.service, super.key});

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
