import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/provider/auth_state_provider.dart';
import 'package:news_app/views/component/button.dart';
import 'package:news_app/views/component/snack_bar.dart';
import 'package:news_app/views/component/text_field.dart';
import 'package:news_app/views/constant/string.dart';

class ForgotPassword extends ConsumerWidget {
  final emailController = TextEditingController();
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              String.forgotPassword,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              String.dontWorry,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            EmailTextField(
              emailController: emailController,
              text: 'Username',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: GestureDetector(
          onTap: () {
            ref
                .watch(authStateProvider.notifier)
                .resetPassword(email: emailController.text);
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar('Link is sent to your email'),
            );
          },
          child: const ButtonWidget(text: 'Submit'),
        ),
      ),
    );
  }
}
