import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
import '../utils/validaciones.dart';
import '../widgets/alerta.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool comprobandoSesion = true; // true mientras se comprueba el token guardado
  bool cargando = false; // true mientras se espera la respuesta del login

  @override
  void initState() {
    super.initState();
    comprobarSesion();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Al abrir la app: si hay un token guardado y es válido, va directo a bienvenida
  Future<void> comprobarSesion() async {
    final valido = await AuthService.tokenValido();
    if (!mounted) return;

    if (valido) {
      context.go('/bienvenida');
    } else {
      setState(() {
        comprobandoSesion = false;
      });
    }
  }

  Future<void> iniciarSesion() async {
    // Si algún campo no es válido, no se llama a la API
    if (!formKey.currentState!.validate()) return;

    setState(() {
      cargando = true;
    });

    final resultado = await AuthService.login(
      emailController.text.trim(),
      passwordController.text,
    );

    if (!mounted) return;
    setState(() {
      cargando = false;
    });

    final bool ok = resultado["ok"];
    final String mensaje = resultado["mensaje"];

    // Ante cualquier respuesta se muestra una alerta
    await mostrarAlerta(context, ok ? "Bienvenido" : "Error", mensaje);

    if (!mounted) return;
    if (ok) {
      context.go('/bienvenida');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Pantalla de carga mientras se comprueba el token
    if (comprobandoSesion) {
      return Scaffold(
        backgroundColor: Colors.blue[50],
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text("Comprobando sesión..."),
              SizedBox(height: 4),
              Text(
                "Puede tardar hasta 1 minuto la primera vez",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.explore, size: 64, color: Colors.blue),
                      const SizedBox(height: 8),
                      const Text(
                        "Canarias Explorer",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text("Inicia sesión para continuar"),
                      const SizedBox(height: 24),

                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: validarEmail,
                      ),
                      const SizedBox(height: 16),

                      TextFormField(
                        controller: passwordController,
                        obscureText: true, // oculta la contraseña
                        decoration: const InputDecoration(
                          labelText: "Contraseña",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        validator: validarPasswordLogin,
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: cargando ? null : iniciarSesion,
                          child: cargando
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text("Iniciar sesión"),
                        ),
                      ),

                      if (cargando) ...[
                        const SizedBox(height: 8),
                        const Text(
                          "Puede tardar hasta 1 minuto...",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],

                      const SizedBox(height: 8),
                      TextButton(
                        style: TextButton.styleFrom(foregroundColor: Colors.blue),
                        onPressed: () => context.go('/registro'),
                        child: const Text("¿No tienes cuenta? Regístrate"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
