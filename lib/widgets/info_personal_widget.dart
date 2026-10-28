import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class InfoPersonalWidget extends StatelessWidget {
  final int opcionBody;

  const InfoPersonalWidget({super.key, required this.opcionBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      color: AppColors.infoBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FOTO (cambia según la pestaña seleccionada)
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
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
          const SizedBox(width: 15),
          // TEXTO
          const Expanded(
            child: Text(
              "Soy estudiante de Desarrollo de Aplicaciones Multiplataforma, y mi execelente profesor al que le gusta enrevesar prácticas es Adrian.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
