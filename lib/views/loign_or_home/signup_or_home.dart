import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/is_logged_In_provider.dart';
import 'package:news_app/views/main/pages/homa_page.dart';
import 'package:news_app/views/login/login_signup_view.dart';
import 'package:news_app/views/loign_or_home/local_is_login_storage.dart';

class SingUPOrHome extends ConsumerWidget {
  const SingUPOrHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final LocalIsLoginStoreage localIsLoginStoreage = LocalIsLoginStoreage();
    if (isLoggedIn) {
      localIsLoginStoreage.storeIsLogin(true);
      return HomePage();
    } else {
      return LoginSingUpView();
    }
  }
}
