import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/news_catagory/news_catagory_states.dart';

List newsCategory = <String>[
  'General',
  'Entertainment',
  'Business',
  'Health',
  'Travel',
  'Technolgy',
];

class NewsCategoryList extends ConsumerWidget {
  const NewsCategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return SizedBox(
      height: height * 0.08,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsCategory.length,
        itemBuilder: (context, index) {
          return Consumer(builder: (context, ref, child) {
            final currentIndex = ref.watch(newsCategoryProvider);
            return InkWell(
              onTap: () {
                ref.watch(newsCategoryProvider.notifier).toogle(index);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                alignment: Alignment.center,
                decoration: index == currentIndex
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                      )
                    : null,
                child: Text(
                  newsCategory[index].toString(),
                  style: index == currentIndex
                      ? const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)
                      : const TextStyle(
                          color: Colors.white,
                        ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
