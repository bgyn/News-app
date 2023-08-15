import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/model/auth_result.dart';
import 'package:news_app/views/component/facebook_button.dart';
import 'package:news_app/views/component/google_button.dart';
import 'package:news_app/views/constant/string.dart';
import 'package:news_app/views/login/logjn_signin_view.dart';
import 'package:news_app/views/login/toggle_provider.dart';
import 'package:news_app/views/main_view.dart';
import 'package:news_app/views/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../states/auth/provider/auth_state_provider.dart';

class LoginSingUpView extends ConsumerWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginSingUpView({super.key});

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
              const Text(
                String.hello,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                String.signUpToGetStarted,
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
              const Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Remember me')
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                        .signUpWithEmailPassword(
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
                    'Login',
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
                  const Text(String.alreadyHaveAnAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginSingInView()));
                    },
                    child: const Text(String.login),
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
