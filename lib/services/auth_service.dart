import 'dart:convert';
import 'package:http/http.dart' as http;
import 'secure_storage_service.dart';

// Servicio que agrupa TODAS las peticiones HTTP a la API.
class AuthService {
  static const String baseUrl = "https://my-users-api.onrender.com";


  static const String rutaRegistro = "/register";
  static const String rutaLogin = "/login";
  static const String rutaBienvenida = "/";
  static const String rutaValidar = "/welcome"; // ruta protegida para comprobar el token

  // La API en Render puede tardar ~1 minuto en despertar
  static const Duration espera = Duration(seconds: 90);

  // Saca el mensaje de la respuesta de la API 
  static String _sacarMensaje(String body, String porDefecto) {
    try {
      final datos = jsonDecode(body);
      return (datos["message"] ??
              datos["msg"] ??
              datos["mensaje"] ??
              datos["detail"] ??
              porDefecto)
          .toString();
    } catch (e) {
      return porDefecto;
    }
  }

  // REGISTRO: devuelve {"ok": true/false, "mensaje": "..."}
  static Future<Map<String, dynamic>> registrar(
      String nombre, String email, String password) async {
    try {
      final respuesta = await http
          .post(
            Uri.parse(baseUrl + rutaRegistro),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "name": nombre, // AJUSTAR si la API usa otro nombre de campo
              "email": email,
              "password": password,
            }),
          )
          .timeout(espera);

      final ok = respuesta.statusCode == 200 || respuesta.statusCode == 201;
      return {
        "ok": ok,
        "mensaje": _sacarMensaje(
            respuesta.body, ok ? "Usuario registrado" : "Error al registrar"),
      };
    } catch (e) {
      return {"ok": false, "mensaje": "No se pudo conectar con el servidor"};
    }
  }

  // LOGIN: si va bien, guarda el token con el servicio de almacenamiento seguro
  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final respuesta = await http
          .post(
            Uri.parse(baseUrl + rutaLogin),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({"email": email, "password": password}),
          )
          .timeout(espera);

      if (respuesta.statusCode == 200 || respuesta.statusCode == 201) {
        final datos = jsonDecode(respuesta.body);
        final token = datos["token"] ?? datos["access_token"];

        if (token == null) {
          return {"ok": false, "mensaje": "La API no devolvió ningún token"};
        }

        await SecureStorageService.guardarToken(token.toString());
        return {
          "ok": true,
          "mensaje": _sacarMensaje(respuesta.body, "Sesión iniciada"),
        };
      }

      return {
        "ok": false,
        "mensaje": _sacarMensaje(respuesta.body, "Email o contraseña incorrectos"),
      };
    } catch (e) {
      return {"ok": false, "mensaje": "No se pudo conectar con el servidor"};
    }
  }

  // COMPROBAR TOKEN: hay token guardado y la API lo da por válido
  static Future<bool> tokenValido() async {
    final token = await SecureStorageService.leerToken();
    if (token == null) return false;

    try {
      final respuesta = await http.get(
        Uri.parse(baseUrl + rutaValidar),
        headers: {"Authorization": "Bearer $token"},
      ).timeout(espera);

      return respuesta.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // MENSAJE DE BIENVENIDA de la API
  static Future<Map<String, dynamic>> mensajeBienvenida() async {
    final token = await SecureStorageService.leerToken();

    try {
      final respuesta = await http.get(
        Uri.parse(baseUrl + rutaBienvenida),
        headers: {"Authorization": "Bearer $token"},
      ).timeout(espera);

      return {
        "ok": respuesta.statusCode == 200,
        "mensaje": _sacarMensaje(respuesta.body, "Sin mensaje"),
      };
    } catch (e) {
      return {"ok": false, "mensaje": "No se pudo conectar con el servidor"};
    }
  }

  // CERRAR SESIÓN: borra el token del dispositivo
  static Future<void> cerrarSesion() async {
    await SecureStorageService.borrarToken();
  }
}