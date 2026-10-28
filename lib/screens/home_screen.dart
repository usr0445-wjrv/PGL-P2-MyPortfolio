import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Canarias Explorer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF99C7EE),
        foregroundColor: Colors.black,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.5),
          child: Divider(height: 1.5, thickness: 1.5, color: Colors.black),
        ),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text(
          "Pantalla principal",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}