import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/category_news_model.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:news_app/views/news_headline/news_headline.dart';

enum FilterMenu { bbcNews, abcNews, cnn, alJazeeraEnglish, foxNews, alJzeera }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final format = DateFormat("MMMM dd,yyyy");
  FilterMenu? selectedMenu;
  String source = 'bbc-news';
  NewsHeadlineViewModel newsHeadlineViewModel = NewsHeadlineViewModel();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
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
                source = 'bbc-news';
              } else if (FilterMenu.abcNews.name == item.name) {
                source = "abc-news";
              } else if (FilterMenu.foxNews.name == item.name) {
                source = 'fox-news';
              } else if (FilterMenu.alJazeeraEnglish.name == item.name) {
                source = 'al-jazeera-english';
              } else {
                source = item.name;
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
            NewsHeadline(newsSource: source),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<CategoryNewsModel>(
              future: newsHeadlineViewModel.fetchNewsCategory('all'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      // DateTime dateTime = DateTime.parse(snapshot
                      //     .data!.articles![index].publishedAt
                      //     .toString());

                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: snapshot
                                    .data!.articles![index].urlToImage
                                    .toString(),
                                fit: BoxFit.cover,
                                width: width * 0.3,
                                height: height * 0.15,
                                placeholder: (context, url) => const SizedBox(
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: height * 0.15,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.articles![index].title
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.articles![index]
                                                .source!.name
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          // Text(
                                          //   format.format(dateTime).toString(),
                                          //   style: GoogleFonts.poppins(
                                          //     fontSize: 12,
                                          //     fontWeight: FontWeight.w500,
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
