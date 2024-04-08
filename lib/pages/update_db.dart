import 'package:flutter/material.dart';
import 'package:wmservice/vars_models.dart';
// import 'package:wmservice/menu/drawer_menu.dart';

class UpdateDB extends StatelessWidget {

  const UpdateDB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WMService'),
        backgroundColor: wmColor,
      ),
      // drawer: const DrawerMenu(),
      body: const Center(
        child: Text('Updating DB'),
      ),
    );
  }
}
