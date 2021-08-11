import 'package:exam10/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  var theme = ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.grey.shade300,
        fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.light,
      );
  var light = ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.grey.shade300,
        fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.dark,
      );

  var thmeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examine',
      theme: theme,
      darkTheme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.grey.shade800,
        fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      home: LoginPage(),
    );
  }
}
