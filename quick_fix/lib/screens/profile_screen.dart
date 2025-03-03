import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _reviews = [
      {
        "user": "Alice",
        "review": "Excelente servicio, muy profesional.",
      },
      {
        "user": "Bob",
        "review": "Muy buen trabajo, lo recomiendo.",
      },
      {
        "user": "Charlie",
        "review": "Servicio rápido y eficiente.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar y Nombre
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage("https://via.placeholder.com/150"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "John Doe",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCategoryChip("Mudanza"),
                      _buildCategoryChip("Plomería"),
                      _buildCategoryChip("Carpintería"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildRating(4.5),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Descripción
            const Text(
              "Acerca de mí",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis sollicitudin nunc.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),

            // Ubicación y Precio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("📍 Ciudad: Medellín", style: TextStyle(fontSize: 16)),
                Text("\$100,000 /hr",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),

            // Botón para contratar
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Contratar servicio"),
              ),
            ),
            const SizedBox(height: 20),

            // Reseñas de usuarios
            const Text(
              "Reseñas de usuarios",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children:
                    _reviews.map((review) => _buildReview(review)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para categorías
  Widget _buildCategoryChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.blue.shade100,
      ),
    );
  }

  // Widget para calificación con estrellas
  Widget _buildRating(double rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
        );
      }),
    );
  }

  // Widget para mostrar una reseña
  Widget _buildReview(Map<String, String> review) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(review["user"]!),
        subtitle: Text(review["review"]!),
      ),
    );
  }
}
