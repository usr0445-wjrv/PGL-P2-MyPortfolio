import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static const Color _fondo = AppColors.drawerBackground;

  Widget _opcion(BuildContext context, String texto, String ruta) {
    final rutaActual = GoRouterState.of(context).uri.path;
    final seleccionada = rutaActual == ruta;

    return InkWell(
      onTap: () => context.go(ruta),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            decoration:
                seleccionada ? TextDecoration.underline : TextDecoration.none,
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ancho =
        (MediaQuery.of(context).size.width * 0.55).clamp(200.0, 300.0).toDouble();

    return Drawer(
      backgroundColor: _fondo,
      width: ancho,
      shape: const RoundedRectangleBorder(), // esquinas rectas como en el concepto
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono de hamburguesa (cierra el Drawer al pulsarlo)
            InkWell(
              onTap: () => Scaffold.of(context).closeDrawer(),
              child: Container(
                height: 56,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.menu, size: 40, color: Colors.black),
              ),
            ),
            const Divider(height: 1, thickness: 1.5, color: Colors.black),
            const SizedBox(height: 12),

            _opcion(context, "WELCOME", '/bienvenida'),
            _opcion(context, "PORTFOLIO", '/portfolio'),
          ],
        ),
      ),
    );
  }
}