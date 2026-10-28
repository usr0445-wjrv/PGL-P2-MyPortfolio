import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FooterBotonesWidget extends StatelessWidget {
  final Function(int) onTap;

  const FooterBotonesWidget({super.key, required this.onTap});

  Widget _boton(String texto, Color color, int valor) {
    return ClipOval(
      child: GestureDetector(
        onTap: () => onTap(valor),
        child: Container(
          width: 80,
          height: 80,
          color: color,
          child: Center(
            child: Text(
              texto,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _boton("Hobbies", AppColors.primary, 0),
          _boton("Repo", AppColors.accent, 1),
        ],
      ),
    );
  }
}
