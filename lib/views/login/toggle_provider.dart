import 'package:hooks_riverpod/hooks_riverpod.dart';

class ToggleProvider extends StateNotifier<bool> {
  ToggleProvider([bool isObscure = true]) : super(isObscure);
  void obscureText() {
    state = !state;
  }
}

final toggleProvider =
    StateNotifierProvider<ToggleProvider, bool>((_) => ToggleProvider());
