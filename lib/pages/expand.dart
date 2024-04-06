import 'package:flutter/material.dart';
import 'package:wmservice/vars_models.dart';
// import 'package:wmservice/menu/drawer_menu.dart';

class ExpandTicket extends StatelessWidget {

  const ExpandTicket({super.key, required this.foundTickets});

  final Map foundTickets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WMService'),
        backgroundColor: wmColor,
      ),
      // drawer: const DrawerMenu(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
              border: TableBorder.all(width: 0.2),
              children: foundTickets.entries.map((entry) {
                return TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(entry.key),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(entry.value.toString()),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
