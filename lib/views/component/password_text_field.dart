import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/views/login/toggle_provider.dart';

class PasswordTextField extends ConsumerWidget {
  final TextEditingController passwordController;
  final String text;
  const PasswordTextField(
      {super.key, required this.passwordController, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        const SizedBox(
          height: 10,
        ),
        Consumer(
          builder: (_, ref, child) {
            final isObscure = ref.watch(obscureTextProvider);
            return TextField(
              controller: passwordController,
              obscureText: isObscure,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      ref.watch(obscureTextProvider.notifier).obscureText();
                    },
                    icon: isObscure
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined)),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
