import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/app_drawer.dart';
import '../widgets/info_personal_widget.dart';
import '../widgets/body_hobbies_widget.dart';
import '../widgets/body_repositorio_widget.dart';
import '../widgets/footer_botones_widget.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  // 0 = Hobbies, 1 = Repo (ya no es una variable global)
  int opcionBody = 0;

  final List<String> hobbies = const [
    "Salir a pasear",
    "Programar",
    "Ver peliculas",
    "Ir a la playa",
    "Videojuegos",
    "Salir con amigos",
    "Ver series",
    "Dormir",
    "Escuchar música",
    "Anime",
    "Jugar baloncesto",
    "Aprender cosas nuevas",
    "Viajar",
    "Cocinar",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El AppBar sustituye a la antigua cabecera naranja y da el botón del Drawer
      appBar: AppBar(
        title: const Text(
          "Portfolio de Wilson",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            InfoPersonalWidget(opcionBody: opcionBody),
            Expanded(
              child: opcionBody == 0
                  ? BodyHobbiesWidget(hobbies: hobbies)
                  : const BodyRepositorioWidget(),
            ),
            FooterBotonesWidget(
              onTap: (value) => setState(() => opcionBody = value),
            ),
          ],
        ),
      ),
    );
  }
}
