import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_fix/widgets/logout.dart';
import 'dart:io';

import 'package:quick_fix/widgets/provider_custom-bottom_navigation.dart';

class ProviderSettingsScreen extends StatefulWidget {
  const ProviderSettingsScreen({super.key});

  @override
  State<ProviderSettingsScreen> createState() => _ProviderSettingsScreenState();
}

class _ProviderSettingsScreenState extends State<ProviderSettingsScreen> {
  File? _image;
  final _picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specialtyController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configuración de Perfil")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Imagen de perfil
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                    : null,
              ),
            ),
            const SizedBox(height: 20),

            // Campo de Nombre
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Nombre Completo",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),

            // Campo de Especialidad
            TextField(
              controller: _specialtyController,
              decoration: const InputDecoration(
                labelText: "Especialidad (Ej: Plomero, Electricista)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
              ),
            ),
            const SizedBox(height: 15),

            // Campo de Descripción
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Descripción",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 15),

            // Botón Guardar Cambios
            ElevatedButton(
              onPressed: () {
                // Aquí se enviarán los datos al backend
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cambios guardados con éxito")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child:
                  const Text("Guardar Cambios", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),

            // Botón para cerrar sesión
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _logout(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Cerrar Sesion"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:
          const ProviderCustomBottomNavigationBar(currentIndex: 3),
    );
  }
}

// Función para cerrar sesión
void _logout(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Cerrar Sesion"),
      content: const Text("Estas seguro de que quieres Cerrar tu Perfil"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            GoRouter.of(context).go('/');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cerrado Correctamente")),
            );
          },
          child: const Text("Cerrar", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}
