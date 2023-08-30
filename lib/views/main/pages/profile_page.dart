import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/auth_state_provider.dart';
import 'package:news_app/views/loign_or_home/signin_or_home.dart';



class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: TextButton(
        onPressed: () {
          ref.watch(authStateProvider.notifier).logOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SingInOrHome(),
            ),
          );
        },
        child: const Text("Logout"),
      ),
    );
  }
}
