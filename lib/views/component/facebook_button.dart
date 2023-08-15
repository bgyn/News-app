import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/views/constant/string.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.facebook,
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            child: Text(String.facebook),
          )
        ],
      ),
    );
  }
}
