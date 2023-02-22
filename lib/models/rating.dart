import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:hafefly/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable(explicitToJson: true)
class Rating {
  final String userUID;
  final String barberUID;
  double rating;
  Rating(
      {required this.userUID, required this.barberUID, required this.rating});
  factory Rating.fromJson(Map<String, Object?> json) => _$RatingFromJson(json);
  Map<String, Object?> toJson() => _$RatingToJson(this);
}

@Collection<Barber>('users')
@Collection<Rating>('users/*/orders')
final barbersReff = UserDataCollectionReference();
