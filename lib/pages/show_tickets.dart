import 'package:flutter/material.dart';
// import 'package:wmservice/menu/drawer_menu.dart';
import 'package:wmservice/pages/expand.dart';
import 'package:wmservice/vars_models.dart';

class ShowTickets extends StatelessWidget {

  const ShowTickets({super.key, required this.foundTickets});
  final List<Map> foundTickets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WMService'),
        backgroundColor: wmColor,
      ),
      // drawer: const DrawerMenu(),
      body: Center(
        child: ListView.builder(
          itemCount: foundTickets.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('${foundTickets[index]['DATE']}  ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              title: Text('${foundTickets[index]['STREET']} ${foundTickets[index]['HOUSE']}, ${foundTickets[index]['FLAT']}'),
              subtitle: Text('${foundTickets[index]['MARK']} - ${foundTickets[index]['REPAIR']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpandTicket(foundTickets: foundTickets[index])),
                );
              },
            );
          },
        )
      ),
    );
  }
}
