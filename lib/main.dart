import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/logout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Ubah warna tema
        fontFamily: 'Poppins', // Ganti font default
      ),
      home: LoginPage(),
    );
  }
}
