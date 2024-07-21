import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key, required this.hostel});

  final Map<String, dynamic> hostel;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [RevenueCard(widget: widget)]);
  }
}

class RevenueCard extends StatelessWidget {
  const RevenueCard({
    super.key,
    required this.widget,
  });

  final HomeLayout widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('REVENUE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(widget.hostel['dateRange']),
                      ))
                ],
              ),
              Text("₹ ${widget.hostel['revenue']}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Text("${widget.hostel['percentage']}%",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              const Text("From last month",
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ));
  }
}
