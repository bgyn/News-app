import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/is_logged_in_provider.dart';
import 'package:news_app/views/main_view/homa_page.dart';
import 'package:news_app/views/login/logjn_signin_view.dart';
import 'package:news_app/views/loign_or_home/local_is_login_storage.dart';

class SingInOrHome extends ConsumerWidget {
  const SingInOrHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final LocalIsLoginStoreage localIsLoginStoreage = LocalIsLoginStoreage();
    if (isLoggedIn) {
      localIsLoginStoreage.storeIsLogin(true);
      return HomePage();
    } else {
      return LoginSingInView();
    }
  }
}
