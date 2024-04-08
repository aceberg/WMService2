import 'package:flutter/material.dart';
// import 'package:wmservice/menu/drawer_menu.dart';
import 'package:wmservice/pages/show_tickets.dart';
import 'package:wmservice/services/db.dart';
import 'package:wmservice/vars_models.dart';

class AdvancedSearch extends StatelessWidget {

  const AdvancedSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WMService'),
        backgroundColor: wmColor,
      ),
      // drawer: const DrawerMenu(),
      body: const AdvancedSearchForm(),
    );
  }
}

class AdvancedSearchForm extends StatefulWidget {
  const AdvancedSearchForm({super.key});

  @override
  AdvancedSearchFormState createState() => AdvancedSearchFormState();
}

class AdvancedSearchFormState extends State<AdvancedSearchForm> {
  
  Map<String, TicketLine> toSearch = makeTicketLineMap();
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: buildPaddingList(toSearch, context)
        ),
      ),
    );
  }
}

Column buildPaddingList(Map<String, TicketLine> toSearch, BuildContext context) {
  
  List<Padding> myPadding = List.empty(growable: true);

  for (var e in toSearch.entries) {
    myPadding.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
        child:TextFormField(
          decoration: InputDecoration(
            hintText: e.value.name,
          ),
          onChanged: (value) {
            toSearch[e.key]?.value = value.toLowerCase().trim();
          },
        ),
      ),
    );
  }

  myPadding.add(
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: ElevatedButton(
        onPressed: () async {
          List<Map> foundTickets = await advancedSearchTicket(toSearch);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShowTickets(foundTickets: foundTickets)),
          );
        },
        child: const Text('Search'),
      ),
    ),
  );

  Column myCol = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: myPadding,
  );

  return myCol;
}