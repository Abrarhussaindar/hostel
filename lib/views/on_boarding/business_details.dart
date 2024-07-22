// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hostel/helper/functions.dart';
import 'package:hostel/helper/ui_elements.dart';
import 'package:hostel/providers/user_provider.dart';
import 'package:hostel/views/home/home_screen.dart';
import 'package:provider/provider.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key, required this.phone});

  final String phone;

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  var nameValid = true;
  var emailValid = true;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 245),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Your Business",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          const Label(text: "Business Name"),
          Padding(
            padding: const EdgeInsets.all(8),
            child: InputText(
                phoneController: nameController,
                keyboard: TextInputType.text,
                hint: "Business Name",
                min: 5,
                max: 25,
                valid: nameValid,
                error: "Can't be less than 5 characters",
                updateValid: (bool isValid) {
                  setState(() {
                    nameValid = isValid;
                  });
                }),
          ),
          const Label(text: "Business Email"),
          Padding(
            padding: const EdgeInsets.all(8),
            child: InputText(
                phoneController: emailController,
                keyboard: TextInputType.emailAddress,
                hint: "Business Email",
                min: 7,
                max: 50,
                valid: emailValid,
                error: "Invalid email",
                updateValid: (bool isValid) {
                  setState(() {
                    emailValid = isValid;
                  });
                }),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ExpandedButton(
                label: "Continue",
                onPressed: () async {
                  final businessName = nameController.text.trim();
                  final businessEmail = emailController.text.trim();
                  if (businessName.length < 5) {
                    setState(() {
                      nameValid = false;
                    });
                  } else if (!isValidEmail(businessEmail)) {
                    setState(() {
                      emailValid = false;
                    });
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    context
                        .read<UserProvider>()
                        .changeBusinessName(newBusinessName: businessName);
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                phone: widget.phone,
                                name: businessName,
                                email: businessEmail)),
                        (route) => false);
                  }
                },
                isLoading: isLoading),
          )
        ]),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
      child: Row(
        children: [
          Text(text,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
