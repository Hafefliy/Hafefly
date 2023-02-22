// ignore_for_file: file_names
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hafefly/services/auth.dart';
import 'package:hafefly/services/storage.dart';

import '../models/user.dart';
import 'locator.dart';

class UserController {
  late Userr _currentUser;
  final AuthService _authService = locator.get<AuthService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Future init;
  final StorageService _storageService = locator.get<StorageService>();

  UserController() {
    init = initUser();
  }

  Future<Userr> initUser() async {
    _currentUser = await _authService.getUser();
    return _currentUser;
  }

  Userr get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image) async {
    _currentUser.avatarUrl = await _storageService.uploadFile(image);
  }

  Userr? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return Userr(uid: user.uid);
    } else {
      return null;
    }
  }

  Future<String> getDownloadUrl() async {
    return await _storageService
        .getUserProfileImageDownloadUrl(FirebaseAuth.instance.currentUser!.uid);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    _currentUser =
        await _authService.signInWithEmailAndPassword(email, password);
    _currentUser = Userr(
      uid: FirebaseAuth.instance.currentUser!.uid,
      avatarUrl: await getDownloadUrl());
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }
}
