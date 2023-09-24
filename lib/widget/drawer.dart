import 'package:f17_quiz_app/home_page.dart';
import 'package:flutter/material.dart';

class Drivers extends StatelessWidget {
  const Drivers({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white70,
      child: ListView(
        padding: EdgeInsets.all(1),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Nargiza'),
            accountEmail: Text('kulm1987@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Text('NK'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('HomePage'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.android_rounded),
            title: Text('Job Infomation'),
            onTap: () {},
          ),
          AboutListTile(
            icon: Icon(Icons.info),
            child: Text('About'),
            applicationIcon: Icon(Icons.local_play),
            applicationName: 'My Quiz App',
            applicationVersion: 'f17_Quiz_app',
            applicationLegalese: 'Nargiza@2023company',
            aboutBoxChildren: [],
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Exit'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
