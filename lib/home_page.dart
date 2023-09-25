import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/logout_page.dart';
import 'package:flutter_application_1/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _loadUsername();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogoutPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple, // Ubah warna latar belakang
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white, // Ubah warna teks
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Ini adalah halaman User $namauser',
                style: TextStyle(
                  fontFamily: 'T',
                  fontSize: 18,
                  color: Colors.white, // Ubah warna teks
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
