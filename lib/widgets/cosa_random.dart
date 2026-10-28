import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Widget reutilizable para mostrar cada hobby
class CosaRandom extends StatelessWidget {
  final String texto;

  const CosaRandom({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.hobbyFill,
        border: Border.all(color: AppColors.primaryDark, width: 2),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              texto,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
