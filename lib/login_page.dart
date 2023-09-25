import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namacontroller, placeholder, isPassword) {
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }

  _showDialog(pesan, alamat) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(pesan),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => alamat,
                    ),
                  );
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/background.jpg'), // Tambahkan latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 100, // Ubah ukuran ikon
              color: Colors.white, // Ubah warna ikon
            ),
            SizedBox(height: 20),
            _showInput(_usernameController, 'Masukkan Username', false),
            _showInput(_passwordController, 'Masukkan Password', true),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  _saveUsername();
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const HomePage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                            position: offsetAnimation, child: child);
                      },
                    ),
                  );
                  _showDialog('Anda Berhasil Login', const HomePage());
                } else {
                  _showDialog('Username dan Password Salah', const LoginPage());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
