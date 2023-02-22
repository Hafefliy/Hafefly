// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'barbershopModel.g.dart';

@JsonSerializable(explicitToJson: true)
class Barbershop {
  String barbershopUID;
  String name;
  double rating;
  bool vip;
  String location;
  double latitude;
  double longitude;
  String open;
  String close;
  @JsonKey(defaultValue: false, includeIfNull: false)
  bool isLiked;
  int fade;
  int razor;
  int scissors;
  int beard;
  int hairdryer;
  int straightener;

  Barbershop(this.isLiked,
      {required this.barbershopUID,
      required this.name,
      required this.rating,
      required this.vip,
      required this.location,
      required this.latitude,
      required this.longitude,
      required this.open,
      required this.close,
      required this.fade,
      required this.razor,
      required this.scissors,
      required this.beard,
      required this.hairdryer,
      required this.straightener});

  factory Barbershop.fromJson(Map<String, Object?> json) =>
      _$BarbershopFromJson(json);
  Map<String, Object?> toJson() => _$BarbershopToJson(this);
}

@Collection<Barbershop>('barbershops')
@Collection<Barber>('barbershops/*/barbers')
final barbershopsRef = BarbershopCollectionReference();
