import 'package:flutter/material.dart';
import 'package:wmservice/app.dart';
import 'package:wmservice/pages/preferences.dart';
import 'package:wmservice/vars_models.dart';


class DrawerMenu extends Drawer {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: wmColor,
            ),
            child: Image.asset('assets/images/icon.png'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Advanced search'),
            onTap: () {
              
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text('Sync DB'),
            onTap: () {
              
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShowPrefs()),
              );
            },
          ),
        ],
      ),
    );
  }
}