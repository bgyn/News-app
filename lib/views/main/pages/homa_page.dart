import 'package:flutter/material.dart';
import 'package:news_app/views/constant/string.dart';
import 'package:news_app/views/main/component/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return ListView(
      children: [
        SearchField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              String.trending,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                String.seeAll,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        Container(
          height: height * 0.2,
          width: width,
          color: Colors.green,
        )
      ],
    );
  }
}
