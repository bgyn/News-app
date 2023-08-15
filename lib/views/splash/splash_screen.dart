import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/views/login/logjn_signin_view.dart';
import 'package:news_app/views/main_view.dart';
import 'package:news_app/views/onboarding/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String keyLogin = 'login';
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
    // Timer(const Duration(seconds: 2), () {
    //   final isLoggedIn = ref.watch(isLoggedInProvider);
    //   if (isLoggedIn) {
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const MainView(),
    //         ));
    //   } else {
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const OnBoardingView(),
    //         ));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Center(
              child: SvgPicture.asset('assets/images/Vector.svg'),
            )
          ],
        ),
      ),
    );
  }

  //
  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(SplashScreen.keyLogin);
    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainView(),
              ));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginSingInView()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingView()));
      }
    });
  }
}
