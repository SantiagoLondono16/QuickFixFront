import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
                      _buildCategoryChip("Moving"),
                      _buildCategoryChip("Plumbing"),
                      _buildCategoryChip("Carpentry"),
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
              "About me",
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
                Text("📍 City: Medellín", style: TextStyle(fontSize: 16)),
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
                child: const Text("Hire service"),
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
}
