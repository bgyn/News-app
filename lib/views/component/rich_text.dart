import 'package:flutter/material.dart';
import 'package:news_app/views/constant/string.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: '${String.hello}\n',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
          TextSpan(
            text: String.again,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
