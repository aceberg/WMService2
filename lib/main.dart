import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import 'package:wmservice/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final service = await PrefServiceShared.init(
    defaults: {
      'ui_color3': 0xff00aeff,
      'ui_theme': 'light',
      'db_path': '/storage/emulated/0/WMService/rs1.db',
      'sync_key': '',
      'sync_addr': '',
    },
  );

  runApp(
    PrefService(
      service: service,
      child: const MyApp(),
    ),
  );
}