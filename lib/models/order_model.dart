import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:hafefly/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  String orderUID;
  String userUID;
  String barberUID;
  String barbershopUID;
  String time;
  String date;
  bool isFade;
  bool isRazor;
  bool isScissors;
  bool isBeard;
  bool isHairdryer;
  bool isStraitener;
  bool isAtHome;
  bool isConfirmed;
  bool isCanceled;
  bool isPayed;
  @Min(200)
  int price;

  Order(
      {required this.orderUID,
      required this.userUID,
      required this.barberUID,
      required this.barbershopUID,
      required this.time,
      required this.date,
      required this.isFade,
      required this.isRazor,
      required this.isScissors,
      required this.isBeard,
      required this.isHairdryer,
      required this.isStraitener,
      required this.isAtHome,
      required this.isConfirmed,
      required this.price,
      required this.isCanceled,
      required this.isPayed});

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
  Map<String, Object?> toJson() => _$OrderToJson(this);
}

@Collection<UserData>('users')
@Collection<Order>('users/*/orders')
final usersRef = UserDataCollectionReference();
