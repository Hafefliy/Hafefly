// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:hafefly/models/barbershopModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

class Userr {
  final uid;
  String avatarUrl;
  Userr(
      {required this.uid,
      this.avatarUrl =
          "https://firebasestorage.googleapis.com/v0/b/hafefly-android.appspot.com/o/avatar.png?alt=media&token=a863fc44-fae5-486e-a396-4315caa97e69"});
}

@JsonSerializable(explicitToJson: true)
class UserData {
  final String uid;
  String firstname;
  String lastname;
  String phoneNumber;
  String province;
  String instagram;
  int age;
  int haircutsDone;
  String location;
  bool vip;

  UserData(this.haircutsDone,
      {required this.uid,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,
      required this.province,
      required this.instagram,
      required this.age,
      required this.location,
      required this.vip});

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
  Map<String, Object?> toJson() => _$UserDataToJson(this);
}

@Collection<UserData>('users')
@Collection<Barbershop>('users/*/favoriteBarbershops')
final usersRef = UserDataCollectionReference();
