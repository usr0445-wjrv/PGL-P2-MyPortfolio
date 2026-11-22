import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
import '../widgets/alerta.dart';
import '../widgets/app_drawer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // Pide el mensaje de bienvenida a la API y lo muestra en una alerta
  Future<void> pedirMensaje(BuildContext context) async {
    final resultado = await AuthService.mensajeBienvenida();
    if (!context.mounted) return;

    final bool ok = resultado["ok"];
    final String mensaje = resultado["mensaje"];
    mostrarAlerta(context, ok ? "Mensaje de la API" : "Error", mensaje);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "WELCOME",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ),
      drawer: const AppDrawer(),
      body: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/bienvenida.png',
              fit: BoxFit.cover,
            ),
            Align(
              alignment: const Alignment(0, 0.3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      context.go('/home');
                    },
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                    ),
                    onPressed: () => pedirMensaje(context),
                    child: const Text('Mensaje de la API'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
