import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/news_catagory/news_catagory_states.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:news_app/views/news_channel/news_category_list.dart';

class NewsCategory extends StatelessWidget {
  final NewsHeadlineViewModel newsHeadlineViewModel = NewsHeadlineViewModel();
  NewsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Consumer(
      builder: (context, ref, _) {
        final categoryIndex = ref.watch(newsCategoryProvider);
        return FutureBuilder(
          future: newsHeadlineViewModel
              .fetchNewsCategory(newsCategory[categoryIndex].toLowerCase()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  // DateTime dateTime = DateTime.parse(
                  //     snapshot.data!.articles![index].publishedAt.toString());

                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: SizedBox(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              fit: BoxFit.cover,
                              width: width * 0.3,
                              height: height * 0.18,
                              placeholder: (context, url) => const SizedBox(
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: height * 0.18,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        //   format
                                        //       .format(dateTime)
                                        //       .toString(),
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
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
