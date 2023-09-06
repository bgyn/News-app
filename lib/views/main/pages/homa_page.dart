import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:news_app/views/news_channel/all_news.dart';
import 'package:news_app/views/news_headline/news_headline.dart';

enum FilterMenu { bbcNews, abcNews, cnn, alJazeeraEnglish, foxNews }

final filterMenu = StateProvider<String>((_) => 'bbc-news');

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final format = DateFormat("MMMM dd,yyyy");
  String source = 'bbc-news';
  FilterMenu? selectedMenu;
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
          Consumer(
            builder: (context, ref, _) {
              return PopupMenuButton<FilterMenu>(
                initialValue: selectedMenu,
                onSelected: (FilterMenu item) {
                  if (FilterMenu.bbcNews.name == item.name) {
                    source = 'bbc-news';
                  } else if (FilterMenu.abcNews.name == item.name) {
                    source = 'abc-news';
                  } else if (FilterMenu.alJazeeraEnglish.name == item.name) {
                    source = 'al-jazeera-english';
                  } else if (FilterMenu.foxNews.name == item.name) {
                    source = 'fox-news';
                  } else {
                    source = item.name;
                  }
                  selectedMenu = item;
                  ref.read(filterMenu.notifier).state = source;
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<FilterMenu>>[
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
              );
            },
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
            NewsHeadline(),
            const SizedBox(
              height: 10,
            ),
            AllNews(),
          ],
        ),
      ),
    );
  }
}
