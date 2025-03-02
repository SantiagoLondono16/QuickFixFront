import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_fix/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.white),
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
                  CategoryChip(label: "Todos"),
                  CategoryChip(label: "Mudanza"),
                  CategoryChip(label: "Plomeria"),
                  CategoryChip(label: "Carpinteria"),
                  CategoryChip(label: "Electricista"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Sección de servicios cercanos
            const Text(
              "Cercanos a ti",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ServiceCard(
                    name: "camilo",
                    service: "Plomeria",
                    imageUrl: "assets/Plomero.jpg",
                  ),
                  ServiceCard(
                    name: "Andres",
                    service: "Carpinteria",
                    imageUrl: "assets/Carpintero.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
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
        backgroundColor: const Color.fromARGB(255, 93, 169, 231),
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
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/Plomero.jpg"),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(service),
            Row(
              children: List.generate(5, (index) {
                return Icon(Icons.star,
                    color: index < 4 ? Colors.amber : Colors.grey, size: 16);
              }),
            ),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {},
          child: const Text("Contratar", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
