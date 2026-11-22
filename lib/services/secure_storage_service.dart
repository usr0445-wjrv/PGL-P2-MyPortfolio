import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Servicio que se encarga SOLO de guardar el token de forma segura
class SecureStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static const String _claveToken = "token";

  static Future<void> guardarToken(String token) async {
    await _storage.write(key: _claveToken, value: token);
  }

  static Future<String?> leerToken() async {
    return await _storage.read(key: _claveToken);
  }

  static Future<void> borrarToken() async {
    await _storage.delete(key: _claveToken);
  }
}