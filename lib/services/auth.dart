// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hafefly/services/database.dart';

import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userr? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return Userr(uid: user.uid);
    } else {
      return null;
    }
  }

  Stream<Userr?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<Userr> getUser() async {
    var firebaseUser = _auth.currentUser!;
    return Userr(uid: firebaseUser.uid);
  }

  Future getCurrentUser() async {
    return FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(
      String email, String password, UserData userInformation) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user!;
      await DatabaseService(uid: user.uid).setUserData(
          userInformation.firstname,
          userInformation.lastname,
          userInformation.age,
          userInformation.province,
          userInformation.phoneNumber,
          userInformation.instagram,
          userInformation.haircutsDone,
          userInformation.location,
          userInformation.vip);
      return _userFromFirebaseUser(user);
    } catch (e) {
      return print(e.toString());
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      print('loggedOut');
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //APPLE:
}
