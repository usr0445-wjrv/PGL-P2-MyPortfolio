import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Drawer reutilizable: se usa en todas las pantallas para no repetir código.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _ir(BuildContext context, String ruta) {
  context.go(ruta); // go_router sustituye la pantalla y el Drawer se cierra solo
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Menú",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Bienvenida"),
            onTap: () => _ir(context, '/bienvenida'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Portfolio"),
            onTap: () => _ir(context, '/portfolio'),
          ),
        ],
      ),
    );
  }
}
