import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick Fix"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Barra de búsqueda
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar Servicios...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categorías de servicios
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(label: "All"),
                  CategoryChip(label: "Moving"),
                  CategoryChip(label: "Plumbing"),
                  CategoryChip(label: "Carpentry"),
                  CategoryChip(label: "Tech"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Sección de servicios cercanos
            const Text(
              "Near you",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ServiceCard(
                    name: "camilo",
                    service: "Plomeria",
                    imageUrl: "https://via.placeholder.com/50",
                  ),
                  ServiceCard(
                    name: "Andres",
                    service: "Carpinteria",
                    imageUrl: "https://via.placeholder.com/50",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para las categorías
class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.blue.shade100,
      ),
    );
  }
}

// Widget para mostrar tarjetas de servicio
class ServiceCard extends StatelessWidget {
  final String name;
  final String service;
  final String imageUrl;

  const ServiceCard({
    required this.name,
    required this.service,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name),
        subtitle: Text(service),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text("Hire service"),
        ),
      ),
    );
  }
}
