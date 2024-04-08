import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import 'package:wmservice/pages/pref_color.dart';
import 'package:wmservice/vars_models.dart';
import 'package:wmservice/menu/drawer_menu.dart';

class ShowPrefs extends StatelessWidget {

  const ShowPrefs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WMService'),
        backgroundColor: wmColor,
      ),
      drawer: const DrawerMenu(),
      body: PrefPage(children: [
        const PrefTitle(title: Text('General')),
        PrefText(
            label: 'Path to DB',
            pref: 'db_path',
            onChange: (value) {
              dbPath = value.trim();
            },
        ),
        const PrefTitle(title: Text('Theme')),
        PrefRadio(
          title: const Text('Light Theme'),
          value: 'light',
          pref: 'ui_theme',
          onSelect: (){
            wmTheme = 'light';
          },
        ),
        PrefRadio(
          title: const Text('Dark Theme'),
          value: 'dark',
          pref: 'ui_theme',
          onSelect: (){
            wmTheme = 'dark';
          },
        ),
        PrefColor(
          title: const Text('Main Color'),
          pref: 'ui_color',
          onChange: (value) {
            wmColor = value;
          },
        ),
        const PrefTitle(title: Text('Sync DB')),
        PrefText(
            label: 'Passkey',
            pref: 'sync_key',
            onChange: (value) {
              syncKey = value.trim();
            },
        ),
        PrefText(
            label: 'Address:Port',
            pref: 'sync_addr',
            onChange: (value) {
              syncAddr = value.trim();
            },
        ),
      ]),
    );
  }
}
