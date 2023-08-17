import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/states/auth/model/auth_result.dart';

typedef UserId = String;

class Authenticator {
  const Authenticator();
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;

  Future<AuthResult> signUpWithEmailPassword(
      {String? email, String? password}) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return AuthResult.sucess;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
      return AuthResult.failure;
    }
  }

  Future<AuthResult> signInWithEmailAddress(
      {String? email, String? password}) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      return AuthResult.sucess;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
      return AuthResult.failure;
    }
  }

  Future<AuthResult> resetPassword(String? email) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      return AuthResult.sucess;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {}
      return AuthResult.failure;
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Future<AuthResult> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final oAuthCredential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(
        oAuthCredential,
      );
      return AuthResult.sucess;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
