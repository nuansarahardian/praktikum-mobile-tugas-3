import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/login_page.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  void _logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    _logOut(context); // Otomatis log out saat halaman ini diakses
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Tampilan loading sementara
      ),
    );
  }
}
