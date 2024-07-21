import 'package:flutter/material.dart';
import 'package:hostel/views/home/layouts/home_layout.dart';
import 'package:hostel/views/home/layouts/rooms_layout.dart';
import 'package:hostel/views/home/layouts/tenants_layout.dart';
import 'package:hostel/views/home/layouts/tickets_layout.dart';

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
  late Map<String, dynamic> hostel;
  var selectedTab = "Dashboard";
  var isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      hostel = {
        'revenue': 52365,
        'dateRange': '01/08/24 - 31/08/24',
        'percentage': '+0.6',
        'vacantBeds': 12,
        'totalBeds': 150,
        'totalTenant': 138,
        'noticePeroid': 5
      };
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 245),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            CircleAvatar(
                radius: 25,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/user.png',
                    height: 50,
                    width: 50,
                  ),
                )),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome",
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
                Text(widget.name,
                    style: const TextStyle(fontWeight: FontWeight.w500))
              ],
            ),
            const Spacer(),
            const CircleAvatar(
                backgroundColor: Colors.black87,
                child: ClipOval(
                    child: Icon(Icons.question_mark, color: Colors.white)))
          ],
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Stack(
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 85),
                  child:
                      SingleChildScrollView(child: Builder(builder: (context) {
                    if (selectedTab == "Dashboard") {
                      return HomeLayout(hostel: hostel);
                    } else if (selectedTab == "Rooms") {
                      return const RoomsLayout();
                    } else if (selectedTab == "Tenants") {
                      return const TenantsLayout();
                    } else if (selectedTab == "Tickets") {
                      return const TicketsLayout();
                    } else {
                      return const SizedBox();
                    }
                  })),
                ),
          Toolbar(
              selectedTab: selectedTab,
              updateTab: (String tab) {
                setState(() {
                  selectedTab = tab;
                });
              }),
        ],
      ),
    );
  }
}

class Toolbar extends StatelessWidget {
  const Toolbar(
      {super.key, required this.selectedTab, required this.updateTab});

  final String selectedTab;
  final Function(String) updateTab;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black87, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    updateTab("Dashboard");
                  },
                  child: TabOption(
                      icon: Icons.bar_chart,
                      label: "Dashboard",
                      selectedTab: selectedTab),
                ),
                GestureDetector(
                  onTap: () {
                    updateTab("Rooms");
                  },
                  child: TabOption(
                      icon: Icons.door_back_door,
                      label: "Rooms",
                      selectedTab: selectedTab),
                ),
                GestureDetector(
                  onTap: () {
                    updateTab("Tenants");
                  },
                  child: TabOption(
                      icon: Icons.person,
                      label: "Tenants",
                      selectedTab: selectedTab),
                ),
                GestureDetector(
                  onTap: () {
                    updateTab("Tickets");
                  },
                  child: TabOption(
                      icon: Icons.airplane_ticket,
                      label: "Tickets",
                      selectedTab: selectedTab),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class TabOption extends StatelessWidget {
  const TabOption(
      {super.key,
      required this.icon,
      required this.label,
      required this.selectedTab});

  final IconData icon;
  final String label;
  final String selectedTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: label == selectedTab ? Colors.amber : Colors.white),
        Text(label,
            style: TextStyle(
                color: label == selectedTab ? Colors.amber : Colors.white,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
