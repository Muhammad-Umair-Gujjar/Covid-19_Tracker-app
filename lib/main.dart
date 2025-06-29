import 'package:flutter/material.dart';
import 'package:flutter_covid_19_tracker/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}