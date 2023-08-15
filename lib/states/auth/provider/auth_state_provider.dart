import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/model/auth_state.dart';
import 'package:news_app/states/auth/notifier/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifer, AuthState>(
    (_) => AuthStateNotifer());
