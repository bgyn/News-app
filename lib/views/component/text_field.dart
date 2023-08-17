import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final String text;
  final TextEditingController emailController;
  const EmailTextField(
      {super.key, required this.emailController, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
