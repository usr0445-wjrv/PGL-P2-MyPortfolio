import 'package:flutter/material.dart';
import 'hobby_card.dart';

class BodyHobbiesWidget extends StatelessWidget {
  const BodyHobbiesWidget({super.key});

  final List<String> hobbies = const [
    "Salir a pasear",
    "Dormir",
    "Programar",
    "Escuchar música",
    "Ver peliculas",
    "Anime",
    "Ir a la playa",
    "Jugar baloncesto",
    "Videojuegos",
    "Aprender cosas nuevas",
    "Salir con amigos",
    "Viajar",
    "Ver series",
    "Cocinar",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          spacing: 30, // separación horizontal entre tarjetas
          runSpacing: 10, // separación vertical entre filas
          alignment: WrapAlignment.center,
          children: hobbies.map((hobby) => HobbyCard(texto: hobby)).toList(),
        ),
      ),
    );
  }
}