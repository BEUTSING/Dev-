import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // ⚠️ Ton URL locale Symfony
  // Sur émulateur Android  → http://10.0.2.2:8000
  // Sur navigateur/desktop → http://localhost:8000
  // Sur vrai téléphone     → http://TON_IP_LOCAL:8000 (ex: 192.168.1.10:8000)
  static const String baseUrl = 'http://127.0.0.1:8000/api/v1';

  // ─── LOGIN ───────────────────────────────────────────
  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/user/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Sauvegarde le token localement
        await _saveToken(data['token']);
        return {'success': true, 'token': data['token']};
      } else {
        return {'success': false, 'message': data['error'] ?? 'Erreur inconnue'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Impossible de joindre le serveur : $e'};
    }
  }

  // ─── LOGOUT ──────────────────────────────────────────
  static Future<bool> logout() async {
    try {
      final token = await getToken();

      await http.post(
        Uri.parse('$baseUrl/user/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Envoie le token JWT
        },
      );

      // Supprime le token local dans tous les cas
      await _deleteToken();
      return true;
    } catch (e) {
      await _deleteToken(); // Supprime quand même localement
      return false;
    }
  }

  // ─── HELPERS TOKEN ───────────────────────────────────
  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }

  static Future<void> _deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
  }

  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}