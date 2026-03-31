import 'package:fist_app_mobil/service/auth_service.dart';
import 'package:flutter/material.dart';
 import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    await AuthService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _handleLogout(context),
            tooltip: 'Se déconnecter',
          ),
        ],
      ),
      body: const Center(
        child: Text('Bienvenue ! Tu es connecté ✅', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}