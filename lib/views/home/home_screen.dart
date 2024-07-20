import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hostel/helper/ui_elements.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.phone,
      required this.name,
      required this.email});

  final String phone;
  final String name;
  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (context) => Details(
              phone: widget.phone, name: widget.name, email: widget.email));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Details extends StatelessWidget {
  const Details(
      {super.key,
      required this.phone,
      required this.name,
      required this.email});

  final String phone;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SingleChildScrollView(
          child: Column(children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("Entered Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(phone),
              const SizedBox(height: 8),
              Text(name),
              const SizedBox(height: 8),
              Text(email),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Button(
                        label: "Close",
                        onPressed: () {
                          exit(0);
                        },
                        isLoading: false),
                  ),
                ],
              )
            ],
          ),
        ),
      ])),
    );
  }
}
