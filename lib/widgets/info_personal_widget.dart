import 'package:flutter/material.dart';

class InfoPersonalWidget extends StatelessWidget {
  final int opcionBody;

  const InfoPersonalWidget({super.key, required this.opcionBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        border: Border(
          bottom: BorderSide(color: Colors.blue[800]!.withValues(alpha: 0.25)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // FOTO con borde blanco y sombra
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  opcionBody == 1
                      ? "https://images.ps-aws.com/c?url=https%3A%2F%2Fimages.teamtalk.com%2Fcontent%2Fuploads%2F2026%2F04%2F18135409%2FKylian-Mbappe-Real-Madrid-F365-3-1.jpg"
                      : "https://images.ps-aws.com/c?url=https%3A%2F%2Fimages.teamtalk.com%2Fcontent%2Fuploads%2F2023%2F07%2F29133933%2Fpsg-striker-kylian-mbappe.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // NOMBRE + DESCRIPCIÓN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Wilson",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Soy estudiante de Desarrollo de Aplicaciones Multiplataforma, y mi execelente profesor al que le gusta enrevesar prácticas es Adrian.",
                  style: TextStyle(
                    fontSize: 14.5,
                    height: 1.4,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}