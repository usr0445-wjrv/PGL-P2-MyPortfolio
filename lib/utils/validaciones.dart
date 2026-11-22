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

// Para el login solo comprobamos que no esté vacía
String? validarPasswordLogin(String? value) {
  if (value == null || value.isEmpty) return "Escribe tu contraseña";
  return null;
}

// Para el registro la contraseña debe ser segura
String? validarPasswordRegistro(String? value) {
  if (value == null || value.isEmpty) return "Escribe una contraseña";
  if (value.length < 8) return "Mínimo 8 caracteres";
  if (!value.contains(RegExp(r'[A-Za-z]')) || !value.contains(RegExp(r'[0-9]'))) {
    return "Debe tener letras y números";
  }
  return null;
}
