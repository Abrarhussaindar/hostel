import 'package:flutter/material.dart';
import 'package:hostel/providers/user_provider.dart';
import 'package:hostel/views/on_boarding/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Hostel());
}

class Hostel extends StatelessWidget {
  const Hostel({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hostel",
        home: WelcomeScreen(),
      ),
    );
  }
}
