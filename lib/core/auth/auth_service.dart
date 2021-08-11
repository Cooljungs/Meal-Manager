import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.code.toString();
    }
  }

  Future<String> signUp(String email, String password, String password2) async {
    try {
      if (password == password2) {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        return "success";
      } else {
        return "passwords-not-identical";
      }
    } on FirebaseAuthException catch (e) {
      return e.code.toString();
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String errorHandling(error) {
    switch (error) {
      case "invalid-email":
        return "Ungültige Email-Adresse";
      case "wrong-password":
        return "Falsches Passwort";
      case "user-not-found":
        return "Benutzer nicht gefunden";
      case "user-disabled":
        return "Account gesperrt";
      case "too-many-requests":
        return "Bitte versuche es später erneut.";
      case "operation-not-allowed":
        return "Fehlende Berechtigungen";
      case "email-already-in-use":
        return "Benutzer existiert bereits";
      default:
        return "";
    }
  }
}
