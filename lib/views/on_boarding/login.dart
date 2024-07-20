// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hostel/helper/functions.dart';
import 'package:hostel/helper/lists.dart';
import 'package:hostel/helper/ui_elements.dart';
import 'package:hostel/views/on_boarding/otp_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phoneController = TextEditingController();
  var phoneValid = true;
  var selectedCountryCode = '+91';
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 245),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/logo.png', height: 150, width: 150),
            const Text("Welcome to Hostel",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const Text("We will send you an OTP to verify your number",
                style: TextStyle(color: Colors.grey, fontSize: 13)),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 32, 8, 16),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, phoneValid ? 0 : 28),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
                        child: DropdownButton<String>(
                          underline: Container(height: 0),
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          value: selectedCountryCode,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCountryCode = newValue!;
                            });
                          },
                          items: countryCodes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InputText(
                      phoneController: phoneController,
                      keyboard: TextInputType.number,
                      hint: "Enter phone no.",
                      min: 10,
                      max: 10,
                      valid: phoneValid,
                      error: "Invalid phone number",
                      updateValid: (bool isValid) {
                        setState(() {
                          phoneValid = isValid;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Button(
                          label: "Request OTP",
                          onPressed: () async {
                            if (phoneController.text.length < 10 ||
                                !isNumeric(phoneController.text)) {
                              setState(() {
                                phoneValid = false;
                              });
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              await Future.delayed(const Duration(seconds: 2));
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                          phone: selectedCountryCode +
                                              phoneController.text)));
                            }
                          },
                          isLoading: isLoading)),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
