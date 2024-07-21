import 'package:flutter/material.dart';

class TenantsLayout extends StatefulWidget {
  const TenantsLayout({super.key});

  @override
  State<TenantsLayout> createState() => _TenantsLayoutState();
}

class _TenantsLayoutState extends State<TenantsLayout> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Tenants"));
  }
}
