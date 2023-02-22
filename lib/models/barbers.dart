import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'barbers.g.dart';

@JsonSerializable(explicitToJson: true)
class Barber {
  Barber(this.haircutsDone,
      {required this.barberUID,
      required this.firstname,
      required this.lastname,
      required this.experience,
      required this.phoneNumber,
      required this.bio,
      required this.rating,
      required this.workingHours,
      required this.instagram,
      required this.barbershopName,
      required this.barbershopUID}) {
    _$assertBarber(this);
  }

  factory Barber.fromJson(Map<String, Object?> json) => _$BarberFromJson(json);

  String barberUID;
  String firstname;

  @Min(0)
  int haircutsDone;

  String lastname;

  @Min(0)
  int experience;

  @Min(0.0)
  double rating;

  String instagram;
  String barbershopName;
  String barbershopUID;
  String bio;
  String phoneNumber;
  String workingHours;

  Map<String, Object?> toJson() => _$BarberToJson(this);
}

@Collection<Barber>('barbers')
final barbersRef = BarberCollectionReference();
