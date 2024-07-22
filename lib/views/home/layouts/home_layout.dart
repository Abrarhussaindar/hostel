import 'package:fl_chart/fl_chart.dart';
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
    return Column(children: [
      RevenueCard(widget: widget),
      const SizedBox(height: 16),
      RentDetails(widget: widget)
    ]);
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

class RentDetails extends StatelessWidget {
  const RentDetails({
    super.key,
    required this.widget,
  });

  final HomeLayout widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text("Rent Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              const Divider(),
              Row(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: PieChart(PieChartData(
                      centerSpaceRadius: 30,
                      sections: [
                        PieChartSectionData(
                            value: widget.hostel['paidRentPercentage'],
                            color: Colors.blue,
                            radius: 30,
                            title: "${widget.hostel['paidRentPercentage']}%",
                            titleStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                        PieChartSectionData(
                            value: 100.0 - widget.hostel['paidRentPercentage'],
                            color: Colors.grey[300],
                            radius: 30,
                            title:
                                "${100.0 - widget.hostel['paidRentPercentage']}%",
                            titleStyle: const TextStyle(
                                color: Colors.blue,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ],
                    )),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 235, 235, 245),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(width: 1)),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text("Paid",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        border: Border.all(width: 1)),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text("Not Paid",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(Icons.chat_outlined),
                              SizedBox(width: 8),
                              Text("REMIND TO PAY"),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
