import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/is_loading_provider.dart';
import 'package:news_app/states/auth/provider/is_logged_In_provider.dart';
import 'package:news_app/views/component/loading_screen.dart';
import 'package:news_app/views/login/logjn_signin_view.dart';
import 'package:news_app/views/loign_or_home/local_is_login_storage.dart';
import 'package:news_app/views/main/pages/main_page.dart';

class SingInOrHome extends ConsumerWidget {
  const SingInOrHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(isLoadingProvider, (_, isLoading) {
      if (isLoading) {
        LoadingScreen.instance().show(
          context: context,
        );
      } else {
        LoadingScreen.instance().hide();
      }
    });
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final LocalIsLoginStoreage localIsLoginStoreage = LocalIsLoginStoreage();
    if (isLoggedIn) {
      localIsLoginStoreage.storeIsLogin(true);
      return const MainPage();
    } else {
      return LoginSingInView();
    }
  }
}
