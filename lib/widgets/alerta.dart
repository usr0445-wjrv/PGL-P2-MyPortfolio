import 'package:flutter/material.dart';

// Muestra una alerta con un mensaje.
// Se puede usar con await para esperar a que el usuario la cierre.
Future<void> mostrarAlerta(BuildContext context, String titulo, String mensaje) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(titulo),
      content: Text(mensaje),
      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
          onPressed: () => Navigator.pop(context),
          child: const Text("Aceptar"),
        ),
      ],
    ),
  );
}
