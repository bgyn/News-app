import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController textController;
  const TextFieldWidget(
      {super.key, required this.textController, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
