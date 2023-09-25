import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/about_page.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/logout_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> _getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: FutureBuilder<String?>(
              future: _getUserName(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading...');
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text(snapshot.data ?? 'Guest');
                }
              },
            ),
            accountEmail: Text('email@example.com'),
            currentAccountPicture: CircleAvatar(),
          ),
          const DrawerHeader(
            child: Text('Sidemenu'),
          ), // DrawerHeader ListTile(
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
// Navigasi ke halaman Home
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ); // MaterialPageRoute
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LogoutPage()), // Perbarui ini
              );
            },
          ),
        ],
      ),
    );
  }
}
// ListView ;