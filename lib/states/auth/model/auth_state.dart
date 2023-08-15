import 'package:flutter/foundation.dart' show immutable;
import 'package:news_app/states/auth/model/auth_result.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final String? userId;
  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
  });
  const AuthState.unknown()
      : result = null,
        isLoading = false,
        userId = null;
  AuthState copyWithIsLoading(bool isLoading) => AuthState(
        result: result,
        isLoading: isLoading,
        userId: userId,
      );
}
