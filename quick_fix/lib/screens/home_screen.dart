import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_fix/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "Todos";
  final List<Map<String, dynamic>> services = [
    {"name": "Camilo", "service": "Plomeria", "image": "assets/Plomero.jpg", "rating": 3},
    {"name": "Andres", "service": "Carpinteria", "image": "assets/Carpintero.jpg", "rating": 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset("assets/Logo.jpg",
                  width: 30, height: 30, fit: BoxFit.cover),
            ),
            const SizedBox(width: 8),
            Text.rich(
              TextSpan(
                children: const [
                  TextSpan(
                      text: 'Quick ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'Fix',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
  onPressed: () {
    GoRouter.of(context).go('/notifications-user');
  },
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
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar Servicios...",
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  "Todos",
                  "Mudanza",
                  "Plomeria",
                  "Carpinteria",
                  "Electricista"
                ].map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedCategory == category
                            ? Colors.blue
                            : Colors.grey[300],
                        foregroundColor: selectedCategory == category
                            ? Colors.white
                            : Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(category),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            const Text("Cercanos a ti",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: services
                    .where((service) =>
                        selectedCategory == "Todos" ||
                        service["service"] == selectedCategory)
                    .map((service) => ServiceCard(
                        name: service["name"]!,
                        service: service["service"]!,
                        imageUrl: service["image"]!,
                        rating: service["rating"]!))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String name;
  final String service;
  final String imageUrl;
  final int rating;

  const ServiceCard(
      {super.key,
      required this.name,
      required this.service,
      required this.imageUrl,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            context.push('/profile');
          },
          child: CircleAvatar(backgroundImage: AssetImage(imageUrl)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(service),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                );
              }),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/chat');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Icon(Icons.chat, color: Colors.white),
            ),
            const SizedBox(width: 5),
            ElevatedButton(
              onPressed: () {
                context.push('/request-service');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Contratar", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
