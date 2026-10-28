import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Tarjeta reutilizable que muestra un hobby
class HobbyCard extends StatelessWidget {
  final String texto;

  const HobbyCard({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.hobbyFill,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryDark.withValues(alpha: 0.6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              texto,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}