import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/views/main_view/component/search_field.dart';
import 'package:news_app/views/loign_or_home/local_is_login_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends ConsumerWidget {
  final LocalIsLoginStoreage localIsLoginStoreage = LocalIsLoginStoreage();
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: SvgPicture.asset(
            'assets/images/Vector.svg',
            height: 30,
            width: 100,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SearchField(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text()
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const GNav(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 30,
          ),
          activeColor: Colors.blue,
          gap: 2,
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
              iconSize: 24,
            ),
            GButton(
              icon: Icons.explore_outlined,
              text: 'Explore',
              iconSize: 24,
            ),
            GButton(
              icon: Icons.bookmark_outline,
              text: 'Bookmark',
              iconSize: 24,
            ),
            GButton(
              icon: Icons.person_outline,
              text: 'Profile',
              iconSize: 24,
            ),
          ]),
    );
  }
}
