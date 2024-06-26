import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:wmservice/vars_models.dart';


Future<List<Map>> selectAllFromDB() async{
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }
  // Change the default factory. On iOS/Android, if not using `sqlite_flutter_lib` you can forget
  // this step, it will use the sqlite version available on the system.
  databaseFactory = databaseFactoryFfi;

  final db = await openDatabase(dbPath);

  List<Map> allTickets = await db.query('rs_tickets');
  // print('REMSTIR: $allTickets');

  return allTickets;
}

Future<List<Map>> searchTicket(ToSearch toSearch) async{
  
  if (allTickets.isEmpty) {
    allTickets = await selectAllFromDB();
  }

  List<Map> foundTickets = List.empty(growable: true);
  String st = '';
  String ho = '';
  String fl = '';

  for (var t in allTickets) {
    st = t['STREET'].toLowerCase();
    ho = t['HOUSE'].toLowerCase();
    fl = t['FLAT'].toLowerCase();
    if (st.contains(toSearch.street) && ho.contains(toSearch.house) && fl.contains(toSearch.flat)) {
      // print('$t');
      foundTickets.add(t);
    }
  }

  foundTickets.sort((a, b) => (b['DATE']).compareTo(a['DATE']));

  return foundTickets;
}

Future<List<Map>> advancedSearchTicket(Map<String, TicketLine> toSearch) async{
  bool match;
  String strFromDB = '';

  if (allTickets.isEmpty) {
    allTickets = await selectAllFromDB();
  }

  List<Map> foundTickets = List.empty(growable: true);

  for (var t in allTickets) {
    match = true;
    for (var v in toSearch.values) {
      strFromDB = t[v.dbName].toLowerCase();
      if (!strFromDB.contains(v.value)) {
        match = false;
        break;
      }
    }
    if (match) {
      foundTickets.add(t);
    }
  }

  foundTickets.sort((a, b) => (b['DATE']).compareTo(a['DATE']));

  return foundTickets;
}