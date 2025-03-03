import 'package:flutter/material.dart';
import 'package:quick_fix/widgets/provider_custom-bottom_navigation.dart';

class ProviderServicesScreen extends StatelessWidget {
  const ProviderServicesScreen({super.key});

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
            const Text("Mis Servicios", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  _ActiveServiceCard(clientName: "Juan Pérez", service: "Instalación de luces LED", status: "Finalizado"),
                  _ActiveServiceCard(clientName: "Elena Torres", service: "Reparación de cerradura", status: "En progreso"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ProviderCustomBottomNavigationBar(currentIndex: 2),
    );
  }
}

class _ActiveServiceCard extends StatelessWidget {
  final String clientName;
  final String service;
  final String status;

  const _ActiveServiceCard({required this.clientName, required this.service, required this.status, super.key});

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
            color: status == "En progreso" ? Colors.orange : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
