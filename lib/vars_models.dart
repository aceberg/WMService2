import 'package:flutter/material.dart';

// DB content
List<Map> allTickets = List.empty(growable: true);

// Variables for Settings
String dbPath = '';

String wmTheme = 'light';
Color wmColor = Colors.lightGreen;

String syncKey = '';
String syncAddr = '';

// For quick search
class ToSearch {
  String street = '';
  String house = '';
  String flat = '';
}

// For advanced search
class TicketLine {
  String name = '';
  String dbName = '';
  String value = '';

  TicketLine(this.name, this.dbName);
}

Map<String, TicketLine> makeTicketLineMap() {
  Map<String, TicketLine> o = <String, TicketLine>{};

  o['date'] = TicketLine('Date', 'DATE');
  o['mark'] = TicketLine('Mark', 'MARK');
  o['model'] = TicketLine('Model','MODEL');
  o['trouble'] = TicketLine('Trouble','TROUBLE');
  o['trouble1'] = TicketLine('Trouble1','TROUBLE1');
  o['street'] = TicketLine('Street','STREET');
  o['house'] = TicketLine('House','HOUSE');
  o['flat'] = TicketLine('Flat','FLAT');
  o['phone'] = TicketLine('Phone','PHONE');
  o['other'] = TicketLine('Other','OTHER');
  o['repair'] = TicketLine('Repair','REPAIR');
  o['repair1'] = TicketLine('Repair1','REPAIR1');
  o['war'] = TicketLine('Warranty','WAR');
  o['sum'] = TicketLine('Sum','SUM');
  o['note'] = TicketLine('Note','NOTE');

  return o;
}