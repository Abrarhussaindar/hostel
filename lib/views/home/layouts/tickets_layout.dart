import 'package:flutter/material.dart';

class TicketsLayout extends StatefulWidget {
  const TicketsLayout({super.key});

  @override
  State<TicketsLayout> createState() => _TicketsLayoutState();
}

class _TicketsLayoutState extends State<TicketsLayout> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Tickets"));
  }
}
