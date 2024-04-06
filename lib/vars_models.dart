import 'package:flutter/material.dart';

String dbPath = '/data/wmservice/rs1.db';

String wmTheme = 'light';
Color wmColor = Colors.lightGreen;

String syncKey = '';
String syncAddr = '';

class ToSearch {
  late String street;
  late String house;
  late String flat;
}

class Ticket {
  late int id;
  late String date;
  late String mark;
  late String model;
  late String trouble;
  late String trouble1;
  late String street;
  late String house;
  late String flat;
  late String phone;
  late String other;
  late String repair;
  late String repair1;
  late String war;
  late String sum;
  late String note;
}