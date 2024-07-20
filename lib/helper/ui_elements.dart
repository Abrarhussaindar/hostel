import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.isLoading});

  final String label;
  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: isLoading
          ? Padding(
              padding: const EdgeInsets.all(4),
              child: Transform.scale(
                scale: 0.5,
                child: const CircularProgressIndicator(color: Colors.white),
              ))
          : Padding(
              padding: const EdgeInsets.all(12),
              child: Text(label,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
    );
  }
}

class ExpandedButton extends StatelessWidget {
  const ExpandedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.isLoading});

  final String label;
  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Button(
                label: label, onPressed: onPressed, isLoading: isLoading)),
      ],
    );
  }
}

class InputText extends StatelessWidget {
  const InputText(
      {super.key,
      required this.phoneController,
      required this.keyboard,
      required this.hint,
      required this.min,
      required this.max,
      required this.valid,
      required this.error,
      required this.updateValid});

  final TextEditingController phoneController;
  final TextInputType keyboard;
  final String hint;
  final int min;
  final int max;
  final bool valid;
  final String error;
  final Function(bool) updateValid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: TextField(
              controller: phoneController,
              keyboardType: keyboard,
              inputFormatters: [LengthLimitingTextInputFormatter(max)],
              onChanged: (value) {
                if (value.length >= min) {
                  updateValid(true);
                }
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: const TextStyle(fontWeight: FontWeight.normal)),
            ),
          ),
        ),
        valid
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(4),
                child: Text(error, style: const TextStyle(color: Colors.red)),
              )
      ],
    );
  }
}
