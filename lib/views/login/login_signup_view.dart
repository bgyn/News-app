import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/views/component/remember_me.dart';
import 'package:news_app/views/component/text_field.dart';
import 'package:news_app/views/component/facebook_button.dart';
import 'package:news_app/views/component/google_button.dart';
import 'package:news_app/views/component/password_text_field.dart';
import 'package:news_app/views/constant/string.dart';
import 'package:news_app/views/loign_or_home/signin_or_home.dart';

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
                TextFieldWidget(
                  textController: emailController,
                  text: 'Username*',
                ),
                const SizedBox(
                  height: 10,
                ),
                PasswordTextField(
                  passwordController: passwordController,
                  text: 'Password*',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: RememberMe(),
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
                      ref
                          .read(authStateProvider.notifier)
                          .signUpWithEmailPassword(
                              email: emailController.text,
                              password: passwordController.text);
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
                        onPressed: () async {
                          ref
                              .read(authStateProvider.notifier)
                              .signInWithGoogle();
                        },
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
                                builder: (context) => const SingInOrHome()));
                      },
                      child: const Text(String.login),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
