import 'package:flutter/material.dart';
import 'package:news_app/views/login/login_signup_view.dart';
import 'package:news_app/views/onboarding/onboard_model.dart';
import 'package:news_app/views/onboarding/onboard_pages.dart';
import 'package:news_app/views/onboarding/widget/dot_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: demoData.length,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (context, index) => OnboardPages(
              image: demoData[index].image,
              title: demoData[index].title,
              description: demoData[index].description,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              ...List.generate(
                demoData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: DotIndicator(
                    isActive: index == _pageIndex,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    if (_pageIndex == demoData.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginSingUpView(),
                        ),
                      );
                    } else {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: _pageIndex == demoData.length - 1
                      ? const Text("Get Started")
                      : const Text("Next"),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    ));
  }
}
