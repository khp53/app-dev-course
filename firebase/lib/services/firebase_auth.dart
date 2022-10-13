import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final _fauth = FirebaseAuth.instance;

  signUp(String email, String password) async {
    try {
      final cred = await _fauth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is weak!');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists!');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  signIn(String email, String password) async {
    try {
      final cred = await _fauth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
