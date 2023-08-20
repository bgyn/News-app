import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/states/shared_preference/shared_preference.dart';
import 'package:news_app/views/countires/counties_view.dart';
import 'package:news_app/views/loign_or_home/signin_or_home.dart';
import 'package:news_app/views/onboarding/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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

  void whereToGo() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPreferences.getBool(keylogin);
    Timer(
      const Duration(seconds: 2),
      () {
        if (isLoggedIn != null) {
          if (isLoggedIn) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CountriesViews()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SingInOrHome()));
          }
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const OnBoardingView()));
        }
      },
    );
  }
}
