import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news_app/states/auth/backend/authenticator.dart';
import 'package:news_app/states/auth/model/auth_result.dart';
import 'package:news_app/states/auth/model/auth_state.dart';

typedef UserId = String;

class AuthStateNotifer extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();

  AuthStateNotifer() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.sucess,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copyWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  //signup with email password
  Future<void> signInWithEmailPassword(
      {String? email, String? password}) async {
    state = state.copyWithIsLoading(true);
    final result = await _authenticator.signInWithEmailAddress(
      email: email,
      password: password,
    );
    final userId = _authenticator.userId;
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  //create new user
  Future<void> signUpWithEmailPassword(
      {String? email, String? password}) async {
    state = state.copyWithIsLoading(true);
    final result = await _authenticator.signUpWithEmailPassword(
      email: email!,
      password: password!,
    );
    final userId = _authenticator.userId;
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  //reset passoword
  Future<void> resetPassword({String? email}) async {
    await _authenticator.resetPassword(email);
  }

  //signin with google
  Future<void> signInWithGoogle() async {
    state = state.copyWithIsLoading(true);
    final result = await _authenticator.signInWithGoogle();
    final userId = _authenticator.userId;
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }
}
