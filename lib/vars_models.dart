import 'package:flutter/material.dart';

String dbPath = '';

String wmTheme = 'light';
Color wmColor = Colors.lightGreen;

String syncKey = '';
String syncAddr = '';

class ToSearch {
  String street = '';
  String house = '';
  String flat = '';
}

class TicketLine {
  String name = '';
  String dbName = '';
  String value = '';

  TicketLine(this.name, this.dbName);
}

class OneTicket {
  Map<String, TicketLine> ticket = <String, TicketLine>{};
}

Map<String, TicketLine> myData() {
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