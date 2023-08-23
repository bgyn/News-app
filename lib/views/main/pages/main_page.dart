import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/nav_states/nav_state_notifier.dart';
import 'package:news_app/views/main/pages/bookmark_page.dart';
import 'package:news_app/views/main/pages/explore_page.dart';
import 'package:news_app/views/main/pages/homa_page.dart';
import 'package:news_app/views/main/pages/profile_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  static final List<Widget> _screens = <Widget>[
    const HomePage(),
    const ExplorePage(),
    const BookmarkPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: _screens[navIndex.index],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        indicatorColor: Colors.blue,
        selectedIndex: navIndex.index,
        onDestinationSelected: (index) {
          ref.read(navProvider.notifier).onIndexChanged(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_outline_outlined),
            label: 'Bookmark',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
