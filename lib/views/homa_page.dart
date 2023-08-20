import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/auth_state_provider.dart';
import 'package:news_app/views/loign_or_home/local_is_login_storage.dart';
import 'package:news_app/views/loign_or_home/signin_or_home.dart';

class HomePage extends ConsumerWidget {
  final LocalIsLoginStoreage localIsLoginStoreage = LocalIsLoginStoreage();
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              ref.read(authStateProvider.notifier).logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SingInOrHome(),
                ),
              );
              localIsLoginStoreage.storeIsLogin(false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
