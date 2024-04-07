import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import 'package:wmservice/services/db.dart';
import 'package:wmservice/pages/show_tickets.dart';
import 'package:wmservice/services/permissions.dart';
import 'package:wmservice/vars_models.dart';
import 'package:wmservice/menu/drawer_menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'WMService';
    dbPath = PrefService.of(context).get('db_path');
    int intColor = PrefService.of(context).get('ui_color3');
    wmColor = Color(intColor);
    wmTheme = PrefService.of(context).get('ui_theme');
    Brightness wmBr = Brightness.light;
    if (wmTheme == 'dark') {
      wmBr = Brightness.dark;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: wmColor, brightness: wmBr),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: wmColor,
        ),
        body: const MyCustomForm(),
        drawer: const DrawerMenu(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {

  ToSearch toSearch = ToSearch();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child:TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Street",
                labelText: "Street",
              ),
              onChanged: (value) {
                toSearch.street = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "House",
                labelText: "House",
              ),
              onChanged: (value) {
                toSearch.house = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Flat",
                labelText: "Flat",
              ),
              onChanged: (value) {
                toSearch.flat = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ElevatedButton(
              onPressed: () async {
                bool perms = await checkPermissions();
                if (!perms) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This app needs Storage permission'),),
                  );
                }

                List<Map> foundTickets = await searchTicket(toSearch);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowTickets(foundTickets: foundTickets)),
                );
              },
              child: const Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}