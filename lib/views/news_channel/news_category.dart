import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/news_catagory/news_catagory_states.dart';

List newsCategory = [
  'All',
  'General',
  'Entertainment',
  'Business',
  'Health',
  'Travel',
  'Science',
  'Techonolgy',
];

class NewsCategory extends ConsumerWidget {
  const NewsCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsCategory.length,
        itemBuilder: (context, index) {
          return Consumer(builder: (context, ref, child) {
            final currentIndex = ref.watch(newsCategoryProvider);
            return GestureDetector(
              onTap: () {
                ref.watch(newsCategoryProvider.notifier).toogle(index);
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: index == currentIndex
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                      )
                    : null,
                child: Text(
                  newsCategory[index].toString(),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
