import 'package:flutter/material.dart';

class FooterBotonesWidget extends StatelessWidget {
  final int seleccionado;
  final Function(int) onTap;

  const FooterBotonesWidget({
    super.key,
    required this.seleccionado,
    required this.onTap,
  });

  Widget _boton(String texto, Color color, int valor) {
    final activo = seleccionado == valor;
    const textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    const tamano = Size(130, 48);

    if (activo) {
      return FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          minimumSize: tamano,
          shape: const StadiumBorder(),
          textStyle: textStyle,
        ),
        onPressed: () => onTap(valor),
        child: Text(texto),
      );
    }
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(color: color, width: 1.5),
        minimumSize: tamano,
        shape: const StadiumBorder(),
        textStyle: textStyle,
      ),
      onPressed: () => onTap(valor),
      child: Text(texto),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _boton("Hobbies", Colors.blue, 0),
          _boton("Repo", Colors.cyan[600]!, 1),
        ],
      ),
    );
  }
}