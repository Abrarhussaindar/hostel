import 'package:flutter/material.dart';
import 'package:hostel/views/on_boarding/welcome_screen.dart';

void main() {
  runApp(const Hostel());
}

class Hostel extends StatelessWidget {
  const Hostel({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hostel",
      home: WelcomeScreen(),
    );
  }
}
