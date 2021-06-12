import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutorial/pages/home_page.dart';
import 'package:tutorial/pages/login.dart';
import 'package:tutorial/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return MaterialApp(

      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      routes: {
        "/": (context)=>LogIn(),
        myRoutes.homeRoute: (context) => HomePage(),
        myRoutes.loginRoute: (context) => HomePage(),
      },
    );
  }
}
