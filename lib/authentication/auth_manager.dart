import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      {String email, String password}) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
