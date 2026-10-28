import 'package:flutter/material.dart';
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
  // 0 = Hobbies, 1 = Repo
  int opcionBody = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Portfolio de Wilson",
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
      body: SafeArea(
        child: Column(
          children: [
            InfoPersonalWidget(opcionBody: opcionBody),
            Expanded(
              child: opcionBody == 0
                  ? const BodyHobbiesWidget()
                  : const BodyRepositorioWidget(),
            ),
            FooterBotonesWidget(
              seleccionado: opcionBody,
              onTap: (value) => setState(() => opcionBody = value),
            ),
          ],
        ),
      ),
    );
  }
}