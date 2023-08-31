import 'package:hooks_riverpod/hooks_riverpod.dart';

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier([bool isDark = false]) : super(isDark);
  void toggle() {
    state = !state;
  }
}

final themeProvider =
    StateNotifierProvider<DarkModeNotifier, bool>((_) => DarkModeNotifier());
