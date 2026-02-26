import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DarioBuildingsScreen(),
    );
  }
}

class DarioBuildingsScreen extends StatelessWidget {
  const DarioBuildingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        // Título más grande y en blanco
        title: const Text(
          'Darío´s Buildings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26, // Tamaño incrementado
          ),
        ),
        // Ícono blanco a la derecha del título
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.architecture, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra horizontal gris claro con el menú
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              onPressed: () {
                // Acción del menú
              },
            ),
          ),

          // Subtítulo "Proyectos"
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Text(
              "Proyectos",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // Lista de widgets rectangulares (Filas)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildProjectCard(
                  "Torre Corporativa Skyline",
                  "Estructura de cristal templado y acero. 45 niveles con certificación sustentable.",
                  "https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_1.jpg",
                ),
                _buildProjectCard(
                  "Residencial Vista Hermosa",
                  "Complejo de apartamentos de lujo con áreas verdes y acabados de mármol.",
                  "https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_2.jpg",
                ),
                _buildProjectCard(
                  "Complejo Industrial Norte",
                  "Construcción de naves industriales de alto tonelaje con cimentación reforzada.",
                  "https://raw.githubusercontent.com/dariorojas0335/act_11_imgs/refs/heads/main/proy_3.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para crear las filas de los proyectos
  Widget _buildProjectCard(String titulo, String detalles, String imageUrl) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lado Izquierdo: Imagen del proyecto
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[200],
                  child: Icon(Icons.broken_image, color: Colors.grey[400], size: 40),
                );
              },
            ),
          ),
          // Lado Derecho: Información
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    detalles,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
