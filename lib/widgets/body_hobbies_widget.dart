import 'package:flutter/material.dart';
import 'hobby_card.dart';

class BodyHobbiesWidget extends StatelessWidget {
  const BodyHobbiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Row(
          spacing: 50,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HobbyCard(texto: "Salir a pasear"),
                SizedBox(height: 10),
                HobbyCard(texto: "Programar"),
                SizedBox(height: 10),
                HobbyCard(texto: "Ver peliculas"),
                SizedBox(height: 10),
                HobbyCard(texto: "Ir a la playa"),
                SizedBox(height: 10),
                HobbyCard(texto: "Videojuegos"),
                SizedBox(height: 10),
                HobbyCard(texto: "Salir con amigos"),
                SizedBox(height: 10),
                HobbyCard(texto: "Ver series"),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HobbyCard(texto: "Dormir"),
                SizedBox(height: 10),
                HobbyCard(texto: "Escuchar música"),
                SizedBox(height: 10),
                HobbyCard(texto: "Anime"),
                SizedBox(height: 10),
                HobbyCard(texto: "Jugar baloncesto"),
                SizedBox(height: 10),
                HobbyCard(texto: "Aprender cosas nuevas"),
                SizedBox(height: 10),
                HobbyCard(texto: "Viajar"),
                SizedBox(height: 10),
                HobbyCard(texto: "Cocinar"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}