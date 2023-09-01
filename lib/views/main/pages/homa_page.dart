import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view_model/news_headline_view_model.dart';
import 'package:news_app/views/news_headline/news_headline.dart';

enum FilterMenu { bbcNews, abcNews, cnn, alJazeeraEnglish, foxNews, alJzeera }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilterMenu? selectedMenu;
  String? name;
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
          PopupMenuButton<FilterMenu>(
            initialValue: selectedMenu,
            onSelected: (FilterMenu item) {
              if (FilterMenu.bbcNews.name == item.name) {
                name = 'bbc-news';
              } else if (FilterMenu.abcNews.name == item.name) {
                name = "abc-news";
              } else if (FilterMenu.foxNews.name == item.name) {
                name = 'fox-news';
              } else if (FilterMenu.alJazeeraEnglish.name == item.name) {
                name = 'al-jazeera-english';
              } else {
                name = item.name;
              }

              setState(() {
                selectedMenu = item;
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterMenu>>[
              const PopupMenuItem<FilterMenu>(
                value: FilterMenu.bbcNews,
                child: Text("BBC News"),
              ),
              const PopupMenuItem<FilterMenu>(
                value: FilterMenu.alJazeeraEnglish,
                child: Text("Al Jzeera News"),
              ),
              const PopupMenuItem(
                  value: FilterMenu.foxNews,
                  child: Text(
                    "FOX News",
                  )),
              const PopupMenuItem<FilterMenu>(
                value: FilterMenu.cnn,
                child: Text("CNN News"),
              ),
              const PopupMenuItem<FilterMenu>(
                value: FilterMenu.abcNews,
                child: Text("ABC News"),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              "Trending",
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            NewsHeadline(
              newsSource: name!,
            ),
            // const NewsCategory(),
          ],
        ),
      ),
    );
  }
}
