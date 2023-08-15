import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/auth_state_provider.dart';
import 'package:news_app/views/component/facebook_button.dart';
import 'package:news_app/views/component/google_button.dart';
import 'package:news_app/views/component/rich_text.dart';
import 'package:news_app/views/constant/string.dart';
import 'package:news_app/views/login/login_signup_view.dart';
import 'package:news_app/views/login/toggle_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../states/auth/model/auth_result.dart';
import '../main_view.dart';
import '../splash/splash_screen.dart';

class LoginSingInView extends ConsumerWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginSingInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RichTextWidget(),
              const Text(
                String.welcomeBackBgainYouveBeenMissed,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('Useraname'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (_, ref, child) {
                  final isObscure = ref.watch(toggleProvider);
                  return TextField(
                    controller: passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            ref.watch(toggleProvider.notifier).obscureText();
                          },
                          icon: isObscure
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Remember me')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forget The Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                    final result = ref.watch(authStateProvider).result;
                    ref
                        .watch(authStateProvider.notifier)
                        .signInWithEmailPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    if (result == AuthResult.sucess) {
                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreen.keyLogin, true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainView()));
                    }
                  },
                  child: const Text(
                    String.login,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      letterSpacing: 0.12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(String.orContinueWith),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const GoogleButton(),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const FacebookButton(),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(String.dontHaveAnAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginSingUpView()));
                    },
                    child: const Text(String.signup),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
