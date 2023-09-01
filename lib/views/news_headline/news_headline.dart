import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/view_model/news_headline_view_model.dart';

class NewsHeadline extends ConsumerWidget {
  final NewsHeadlineViewModel newsHeadlineViewModel = NewsHeadlineViewModel();
  NewsHeadline({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Trending"),
        ),
        SizedBox(
          child: FutureBuilder(
            future: newsHeadlineViewModel.fetchNewsHeadline(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
