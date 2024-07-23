import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  // get current user for auth gate
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // log in --> 
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    //try user sign in
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up -->
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    // try user sign up
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // log out -->
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}