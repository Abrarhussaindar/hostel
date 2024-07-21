import 'package:flutter/material.dart';

class RoomsLayout extends StatefulWidget {
  const RoomsLayout({super.key});

  @override
  State<RoomsLayout> createState() => _RoomsLayoutState();
}

class _RoomsLayoutState extends State<RoomsLayout> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Rooms"));
  }
}
