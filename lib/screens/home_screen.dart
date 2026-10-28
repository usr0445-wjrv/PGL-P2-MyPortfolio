import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Canarias Explorer"),
      ),
      drawer: const AppDrawer(), // ahora reutilizamos el Drawer común
      body: const Center(
        child: Text(
          "Pantalla principal",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
