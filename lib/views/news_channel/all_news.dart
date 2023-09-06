import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/category_news_model.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:news_app/views/detail/news_detail.dart';

class AllNews extends StatelessWidget {
  AllNews({super.key});

  final NewsHeadlineViewModel newsHeadlineViewModel = NewsHeadlineViewModel();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return SizedBox(
      height: height,
      child: FutureBuilder<CategoryNewsModel>(
        future: newsHeadlineViewModel.fetchNewsCategory('all'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              // shrinkWrap: true,
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                DateTime dateTime = DateTime.parse(
                    snapshot.data!.articles![index].publishedAt.toString());
                final name = snapshot.data!.articles![index].source!.name;
                final title = snapshot.data!.articles![index].title;
                final urlToImg = snapshot.data!.articles![index].urlToImage;
                final content = snapshot.data!.articles![index].content;
                final newsUrl = snapshot.data!.articles![index].url;

                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: InkWell(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data!.articles![index].urlToImage
                                .toString(),
                            fit: BoxFit.cover,
                            width: width * 0.3,
                            height: height * 0.15,
                            placeholder: (context, url) => const SizedBox(
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) => const Icon(
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
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot
                                            .data!.articles![index].source!.name
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
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
