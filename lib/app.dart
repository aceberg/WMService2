import 'package:flutter/material.dart';
import 'package:pref/pref.dart';
import 'package:wmservice/db.dart';
import 'package:wmservice/pages/show_tickets.dart';
import 'package:wmservice/permissions.dart';
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: wmColor),
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

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  ToSearch toSearch = ToSearch();

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
  }

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
              controller: controller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Street",
                labelText: "Street",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: controller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "House",
                labelText: "House",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: controller3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Flat",
                labelText: "Flat",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ElevatedButton(
              onPressed: () async {
                toSearch.street = controller1.text.toLowerCase().trim();
                toSearch.house = controller2.text.toLowerCase().trim();
                toSearch.flat = controller3.text.toLowerCase().trim();

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