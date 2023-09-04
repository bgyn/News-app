import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:news_app/views/countires/service/countries_service.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetail extends ConsumerWidget {
  final String name;
  final String urlToImg;
  final String title;
  final String content;
  final DateTime publishedAt;
  final String newsUrl;

  const NewsDetail({
    super.key,
    required this.name,
    required this.title,
    required this.urlToImg,
    required this.content,
    required this.publishedAt,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    final format = DateFormat("MMMM dd,yyyy");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Share.share(url);
            },
            icon: const Icon(
              (Icons.share),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              width: width,
              height: height * 0.05,
              child: Row(
                children: [
                  Container(
                    width: width * 0.12,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        format.format(publishedAt).toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: urlToImg,
                fit: BoxFit.cover,
                width: width,
                height: height * 0.25,
                placeholder: (context, url) => const SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              content,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}