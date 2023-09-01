import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsCategoryStats extends StateNotifier<int> {
  NewsCategoryStats([int index = 0]) : super(index);
  void toogle(int index) {
    state = index;
  }
}

final newsCategoryProvider =
    StateNotifierProvider<NewsCategoryStats, int>((_) => NewsCategoryStats());
