import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/view_model/news_headline_view_model.dart';
import 'package:news_app/views/news_channel/news_category.dart';
import 'package:news_app/views/news_headline/news_headline.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsHeadlineViewModel newsHeadlineViewModel = NewsHeadlineViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SvgPicture.asset(
            'assets/images/Vector.svg',
            height: 30,
            width: 100,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            NewsHeadline(),
            const NewsCategory(),
          ],
        ),
      ),
    );
  }
}
