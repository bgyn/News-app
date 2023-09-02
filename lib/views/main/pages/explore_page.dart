import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/views/news_channel/news_category.dart';
import 'package:news_app/views/news_channel/news_category_list.dart';

class ExplorePage extends ConsumerWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const NewsCategoryList(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: NewsCategory(),
        ),
      ],
    );
  }
}
