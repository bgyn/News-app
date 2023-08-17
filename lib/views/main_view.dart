import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/auth_state_provider.dart';
import 'package:news_app/states/shared_preference/shared_preference.dart';
import 'package:news_app/views/login/logjn_signin_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              ref.watch(authStateProvider.notifier).logOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginSingInView()));
              final sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setBool(keylogin, false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text("Logged In"),
      ),
    );
  }
}
