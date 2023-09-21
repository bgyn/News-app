import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:news_app/views/detail/news_detail.dart';
import 'package:news_app/views/main/pages/homa_page.dart';

class NewsHeadline extends ConsumerWidget {
  final String? newsSource;
  final NewsHeadlineViewModel newsHeadlineViewModel = NewsHeadlineViewModel();
  NewsHeadline({super.key, this.newsSource});
  final format = DateFormat("MMMM dd,yyyy");
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    final newsSource = ref.watch(filterMenu);
    return SizedBox(
      height: height * 0.4,
      child: FutureBuilder(
        future: newsHeadlineViewModel.fetchNewsHeadline(newsSource),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                DateTime dateTime = DateTime.parse(
                    snapshot.data!.articles![index].publishedAt.toString());
                final name = snapshot.data!.articles![index].source!.name;
                final title = snapshot.data!.articles![index].title;
                final urlToImg = snapshot.data!.articles![index].urlToImage;
                final content = snapshot.data!.articles![index].content;
                final newsUrl = snapshot.data!.articles![index].url;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetail(
                          name: name!,
                          title: title!,
                          urlToImg: urlToImg!,
                          content: content!,
                          publishedAt: dateTime,
                          newsUrl: newsUrl!,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: width * 0.9,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              fit: BoxFit.cover,
                              width: width,
                              height: height * 0.4,
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
                        ),
                        Positioned(
                          bottom: 20,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              alignment: Alignment.bottomCenter,
                              height: height * 0.12,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: width * 0.7,
                                    child: Text(
                                      snapshot.data!.articles![index].title
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width * 0.7,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data!.articles![index]
                                              .source!.name
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          format.format(dateTime),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
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
          }
        },
      ),
    );
  }
}
