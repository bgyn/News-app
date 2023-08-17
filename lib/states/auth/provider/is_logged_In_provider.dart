import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/model/auth_result.dart';
import 'package:news_app/states/auth/provider/auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.sucess;
});
