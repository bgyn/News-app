import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/nav_states/nav_states.dart';

class NavNotifier extends StateNotifier<NavStates> {
  NavNotifier() : super(const NavStates());
  void onIndexChanged(int index) {
    state = state.copyWith(index);
    //state.index
  }
}

final navProvider =
    StateNotifierProvider<NavNotifier, NavStates>((ref) => NavNotifier());
