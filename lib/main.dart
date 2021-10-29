import 'package:flutter/material.dart';
import 'package:wdf/homepage.dart';
import 'package:wdf/p_day_month/p_day_month_start.dart';
import 'package:wdf/p_month/p_month_start.dart';
import 'package:wdf/p_century/p_century_start.dart';
import 'package:wdf/p_year/p_year_start.dart';
import 'package:wdf/p_full/p_full_start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekdays',
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/PMonth': (context) => PMonthStart(),
        '/PYear': (context) => PYearStart(),
        '/PCentury': (context) => PCenturyStart(),
        '/PFull': (context) => PFullStart(),
        '/PDayMonth': (context) => PDayMonthStart(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 30.0),
            bodyText2: TextStyle(fontSize: 24.0),
          )),
    );
  }
}
