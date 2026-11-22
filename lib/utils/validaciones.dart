// Funciones para validar los campos de los formularios.
// Devuelven un texto con el error, o null si el valor es correcto.

String? validarNombre(String? value) {
  if (value == null || value.trim().isEmpty) return "Escribe tu nombre completo";
  if (value.trim().length < 3) return "El nombre es demasiado corto";
  return null;
}

String? validarEmail(String? value) {
  if (value == null || value.trim().isEmpty) return "Escribe tu email";
  final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  if (!regex.hasMatch(value.trim())) return "El email no es válido";
  return null;
}