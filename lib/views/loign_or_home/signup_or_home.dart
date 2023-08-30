// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/is_logged_In_provider.dart';
import 'package:news_app/views/countires/counties_view.dart';
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
      return const CountriesViews();
    } else {
      return LoginSingUpView();
    }
  }
}
