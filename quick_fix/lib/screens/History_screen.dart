import 'package:flutter/material.dart';
import 'package:quick_fix/widgets/custom_bottom_navigation_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de servicios de ejemplo
    final List<Map<String, dynamic>> serviceHistory = [
      {
        "service": "Plomería",
        "provider": "Juan Pérez",
        "date": "15 Feb 2025",
        "status": "Completado",
      },
      {
        "service": "Electricidad",
        "provider": "Carlos Gómez",
        "date": "10 Feb 2025",
        "status": "En Progreso",
      },
      {
        "service": "Pintura",
        "provider": "Ana López",
        "date": "5 Feb 2025",
        "status": "Cancelado",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de Servicios"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: serviceHistory.length,
        itemBuilder: (context, index) {
          final service = serviceHistory[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.build,
                color: _getStatusColor(service["status"]),
              ),
              title: Text(service["service"]),
              subtitle: Text(
                  "Proveedor: ${service["provider"]}\nFecha: ${service["date"]}"),
              trailing: Chip(
                label: Text(service["status"]),
                backgroundColor: _getStatusColor(service["status"]),
                labelStyle: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                _showServiceDetails(context, service);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }

  // Función para obtener el color del estado del servicio
  Color _getStatusColor(String status) {
    switch (status) {
      case "Completado":
        return Colors.green;
      case "En Progreso":
        return Colors.orange;
      case "Cancelado":
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  // Función para mostrar detalles del servicio en un diálogo
  void _showServiceDetails(BuildContext context, Map<String, dynamic> service) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(service["service"]),
        content: Text(
          "Proveedor: ${service["provider"]}\nFecha: ${service["date"]}\nEstado: ${service["status"]}",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }
}
