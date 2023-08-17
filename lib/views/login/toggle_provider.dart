import 'package:hooks_riverpod/hooks_riverpod.dart';

class ObscureTextNotifier extends StateNotifier<bool> {
  ObscureTextNotifier([bool isObscure = true, bool check = true])
      : super(
          isObscure,
        );
  void obscureText() {
    state = !state;
  }
}

final obscureTextProvider = StateNotifierProvider<ObscureTextNotifier, bool>(
    (_) => ObscureTextNotifier());

class IsCheckNotifier extends StateNotifier<bool> {
  IsCheckNotifier([bool check = false])
      : super(
          check,
        );
  void checkBox() {
    state = !state;
  }
}

final isCheckProvider =
    StateNotifierProvider<IsCheckNotifier, bool>((_) => IsCheckNotifier());
