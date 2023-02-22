import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hafefly/services/auth.dart';
import 'package:hafefly/services/locator.dart';


class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  final AuthService _authService = locator.get<AuthService>();
  Future<String> uploadFile(File file) async {
    var user = await _authService.getUser();
    var uid = user.uid;

    var storageRef = storage.ref().child("user/profile/$uid");
    var uploadTask = storageRef.putFile(file);
    String downloadUrl = await (await uploadTask).ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getUserProfileImageDownloadUrl(String uid) async {
    return await storage.ref().child("user/profile/$uid").getDownloadURL();
  }
}