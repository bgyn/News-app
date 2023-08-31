import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/auth_state_provider.dart';
import 'package:news_app/views/loign_or_home/signin_or_home.dart';
import 'package:news_app/views/settings/theme_provider.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(Icons.notifications_none_outlined),
              title: Text(
                "Notification",
              ),
              trailing: Icon(Icons.arrow_right_alt_sharp),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text("Security"),
              trailing: Icon(Icons.arrow_right_alt_sharp),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Help"),
              trailing: Icon(Icons.arrow_right_alt_sharp),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final isSwitched = ref.watch(themeProvider);
              return ListTile(
                leading: const Icon(Icons.dark_mode_outlined),
                title: const Text("Dark Mode"),
                trailing: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      ref.watch(themeProvider.notifier).toggle();
                    }),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              ref.watch(authStateProvider.notifier).logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SingInOrHome(),
                ),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
            ),
          ),
        ],
      ),
    );
  }
}
