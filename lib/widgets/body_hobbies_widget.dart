import 'package:flutter/material.dart';
import 'hobby_card.dart';

class BodyHobbiesWidget extends StatelessWidget {
  final List<String> hobbies;

  const BodyHobbiesWidget({super.key, required this.hobbies});

  // Construye una columna de hobbies con separación entre cajas
  Widget _columna(List<String> items) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final h in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: HobbyCard(texto: h),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mitad = (hobbies.length / 2).ceil();

    // SingleChildScrollView evita el overflow en pantallas pequeñas
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _columna(hobbies.sublist(0, mitad)),
            const SizedBox(width: 40),
            _columna(hobbies.sublist(mitad)),
          ],
        ),
      ),
    );
  }
}
