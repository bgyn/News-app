import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/views/login/toggle_provider.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer(builder: (_, ref, child) {
          final check = ref.watch(isCheckProvider);
          return IconButton(
              onPressed: () => ref.watch(isCheckProvider.notifier).checkBox(),
              icon: check
                  ? const Icon(Icons.check_box)
                  : const Icon(Icons.check_box_outline_blank));
        }),
        const Text('Remember me')
      ],
    );
  }
}
