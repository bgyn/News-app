import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/states/auth/model/auth_result.dart';

typedef UserId = String;

class Authenticator {
  const Authenticator();
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  bool get isAlradyLoggedIn => userId != null;

  Future<AuthResult> signUpWithEmailPassword(
      {String? email, String? password}) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return AuthResult.sucess;
    } on FirebaseAuthException catch (_) {
      return AuthResult.failure;
    }
  }

  Future<AuthResult> signInWithEmailAddress(
      {String? email, String? password}) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      return AuthResult.sucess;
    } on FirebaseAuthException catch (_) {
      return AuthResult.failure;
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
