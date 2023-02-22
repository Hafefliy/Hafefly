// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hafefly/models/barbershopModel.dart';
import 'package:hafefly/models/order_model.dart';
import 'package:hafefly/models/rating.dart';
import 'package:hafefly/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  FirebaseFirestore? _instance;

  // collection reference
  Future<UserData> getUserDataFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference userCollection = _instance!.collection('users');

    DocumentSnapshot userData = await userCollection.doc(uid).get();

    var data = userData.data() as Map<String, dynamic>;

    return UserData(data['haircutsDone'],
        uid: uid,
        firstname: data['firstname'],
        lastname: data['lastname'],
        phoneNumber: data['phoneNumber'],
        province: data['province'],
        instagram: data['instagram'],
        age: data['age'],
        location: data['location'],
        vip: data['vip']);
  }

  Future setUserData(
      String firstname,
      String lastname,
      int age,
      String province,
      String phoneNumber,
      String instagram,
      int haircutsDone,
      String location,
      bool vip) async {
    _instance = FirebaseFirestore.instance;
    CollectionReference userCollection = _instance!.collection('users');
    return await userCollection.doc(uid).set({
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'province': province,
      'phoneNumber': phoneNumber,
      'instagram': instagram,
      'location': location,
      'vip': vip,
      'haircutsDone': haircutsDone
    });
  }

  Future updateUserData(UserData user) async {
    _instance = FirebaseFirestore.instance;
    CollectionReference userCollection = _instance!.collection('users');
    await userCollection.doc(uid).update({
      'firstname': user.firstname,
      'lastname': user.lastname,
      'age': user.age,
      'province': user.province,
      'phoneNumber': user.phoneNumber,
      'instagram': user.instagram,
      'location': user.location,
      'vip': user.vip,
    });
  }

  Future addFavoriteBarbershop(Barbershop barbershop) async {
    _instance = FirebaseFirestore.instance;
    CollectionReference favoriteBarbershopsCollection = _instance!
        .collection('users')
        .doc(uid)
        .collection('favoriteBarbershops');
    return await favoriteBarbershopsCollection
        .doc(barbershop.barbershopUID)
        .set({
      'barbershopUID': barbershop.barbershopUID,
      'name': barbershop.name,
      'rating': barbershop.rating,
      'vip': barbershop.vip,
      'location': barbershop.location,
      'latitude': barbershop.latitude,
      'longitude': barbershop.longitude,
      'open': barbershop.open,
      'close': barbershop.close
    });
  }

  Future removeFavoriteBarbershop(Barbershop barbershop) async {
    _instance = FirebaseFirestore.instance;
    CollectionReference favoriteBarbershopsCollection = _instance!
        .collection('users')
        .doc(uid)
        .collection('favoriteBarbershops');
    return await favoriteBarbershopsCollection
        .doc(barbershop.barbershopUID)
        .delete();
  }

  Future addOrder(Order order) async {
    _instance = FirebaseFirestore.instance;

    CollectionReference userCollection = _instance!.collection('users');

    DocumentSnapshot userData = await userCollection.doc(uid).get();
    var data = userData.data() as Map<String, dynamic>;

    CollectionReference userOrderCollection =
        _instance!.collection('users').doc(uid).collection('orders');
    CollectionReference barbersOrdersCollection = _instance!
        .collection('barbers')
        .doc(order.barberUID)
        .collection('orders');

    CollectionReference barbershopsBarbersOrdersCollection = _instance!
        .collection('barbershops')
        .doc(order.barbershopUID)
        .collection('barbers')
        .doc(order.barberUID)
        .collection('orders');
    await userOrderCollection.doc(order.orderUID).set({
      'userUID': uid,
      'barbershopUID': order.barbershopUID,
      'barberUID': order.barberUID,
      'firstname': data['firstname'],
      'lastname': data['lastname'],
      'time': 'TBC',
      'date': 'TBC',
      'isConfirmed': false,
      'orderUID': order.orderUID,
      'isFade': order.isFade,
      'isRazor': order.isRazor,
      'isScissors': order.isScissors,
      'isBeard': order.isBeard,
      'isHairdryer': order.isHairdryer,
      'isStraitener': order.isStraitener,
      'isAtHome': order.isAtHome,
      'price': order.price,
      'isCanceled': order.isCanceled,
      'isPayed': order.isPayed
    });
    await barbersOrdersCollection.doc(order.orderUID).set({
      'userUID': uid,
      'barbershopUID': order.barbershopUID,
      'barberUID': order.barberUID,
      'firstname': data['firstname'],
      'lastname': data['lastname'],
      'time': 'TBC',
      'date': 'TBC',
      'isConfirmed': false,
      'orderUID': order.orderUID,
      'isFade': order.isFade,
      'isRazor': order.isRazor,
      'isScissors': order.isScissors,
      'isBeard': order.isBeard,
      'isHairdryer': order.isHairdryer,
      'isStraitener': order.isStraitener,
      'isAtHome': order.isAtHome,
      'price': order.price,
      'isCanceled': order.isCanceled,
      'isPayed': order.isPayed
    });
    await barbershopsBarbersOrdersCollection.doc(order.orderUID).set({
      'userUID': uid,
      'barbershopUID': order.barbershopUID,
      'barberUID': order.barberUID,
      'firstname': data['firstname'],
      'lastname': data['lastname'],
      'time': 'TBC',
      'date': 'TBC',
      'isConfirmed': false,
      'orderUID': order.orderUID,
      'isFade': order.isFade,
      'isRazor': order.isRazor,
      'isScissors': order.isScissors,
      'isBeard': order.isBeard,
      'isHairdryer': order.isHairdryer,
      'isStraitener': order.isStraitener,
      'isAtHome': order.isAtHome,
      'price': order.price,
      'isCanceled': order.isCanceled,
      'isPayed': order.isPayed
    });
  }

  Future cancelOrder(Order order) async {
    _instance = FirebaseFirestore.instance;
    CollectionReference userCollection = _instance!.collection('users');
    DocumentSnapshot userData =
        await userCollection.doc(uid).get();
    var data = userData.data() as Map<String, dynamic>;

    CollectionReference userOrderCollection =
        _instance!.collection('users').doc(order.userUID).collection('orders');

    CollectionReference barbersOrdersCollection =
        _instance!.collection('barbers').doc(uid).collection('orders');

    CollectionReference barbershopsBarbersOrdersCollection = _instance!
        .collection('barbershops')
        .doc(order.barbershopUID)
        .collection('barbers')
        .doc(uid)
        .collection('orders');

    await userOrderCollection.doc(order.orderUID).update({
      'userUID': order.userUID,
      'barbershopUID': order.barbershopUID,
      'barberUID': order.barberUID,
      'firstname': data['firstname'],
      'lastname': data['lastname'],
      'time': order.time,
      'date': order.date,
      'isConfirmed': order.isConfirmed,
      'orderUID': order.orderUID,
      'isFade': order.isFade,
      'isRazor': order.isRazor,
      'isScissors': order.isScissors,
      'isBeard': order.isBeard,
      'isHairdryer': order.isHairdryer,
      'isStraitener': order.isStraitener,
      'isAtHome': order.isAtHome,
      'price': order.price,
      'isCanceled': true,
      'isPayed': order.isPayed
    });
    await barbersOrdersCollection.doc(order.orderUID).update({
      'userUID': order.userUID,
      'barbershopUID': order.barbershopUID,
      'barberUID': order.barberUID,
      'firstname': data['firstname'],
      'lastname': data['lastname'],
      'time': order.time,
      'date': order.date,
      'isConfirmed': order.isConfirmed,
      'orderUID': order.orderUID,
      'isFade': order.isFade,
      'isRazor': order.isRazor,
      'isScissors': order.isScissors,
      'isBeard': order.isBeard,
      'isHairdryer': order.isHairdryer,
      'isStraitener': order.isStraitener,
      'isAtHome': order.isAtHome,
      'price': order.price,
      'isCanceled': true,
      'isPayed': order.isPayed
    });
    await barbershopsBarbersOrdersCollection.doc(order.orderUID).update({
      'userUID': order.userUID,
      'barbershopUID': order.barbershopUID,
      'barberUID': order.barberUID,
      'firstname': data['firstname'],
      'lastname': data['lastname'],
      'time': order.time,
      'date': order.date,
      'isConfirmed': order.isConfirmed,
      'orderUID': order.orderUID,
      'isFade': order.isFade,
      'isRazor': order.isRazor,
      'isScissors': order.isScissors,
      'isBeard': order.isBeard,
      'isHairdryer': order.isHairdryer,
      'isStraitener': order.isStraitener,
      'isAtHome': order.isAtHome,
      'price': order.price,
      'isCanceled': true,
      'isPayed': order.isPayed
    });
  }

  Future rateBarber(Rating rating, String barbershopUID) async {
    _instance = FirebaseFirestore.instance;

    DocumentReference barberDocument =
        _instance!.collection('barbers').doc(rating.barberUID);
    DocumentReference barbershopBarberDocument = _instance!
        .collection('barbershops')
        .doc(barbershopUID)
        .collection('barbers')
        .doc(rating.barberUID);

    DocumentSnapshot barberData =
        await _instance!.collection('barbers').doc(rating.barberUID).get();
    var data = barberData.data() as Map<String, dynamic>;

    CollectionReference barberRatingsCollection = _instance!
        .collection('barbers')
        .doc(rating.barberUID)
        .collection('ratings');
    CollectionReference barbershopBarberRatingsCollection = _instance!
        .collection('barbershops')
        .doc(barbershopUID)
        .collection('barbers')
        .doc(rating.barberUID)
        .collection('ratings');
    await barberRatingsCollection.doc(rating.userUID).set({
      'userUID': rating.userUID,
      'barberUID': rating.barberUID,
      'rating': rating.rating
    });
    await barbershopBarberRatingsCollection.doc(rating.userUID).set({
      'userUID': rating.userUID,
      'barberUID': rating.barberUID,
      'rating': rating.rating
    });

    int barberRatingsDocumentsLength =
        await barberRatingsCollection.snapshots().length;
    await barberDocument.update({
      'rating': (data['rating'] + rating.rating) / barberRatingsDocumentsLength
    });
    await barbershopBarberDocument.update({
      'rating': (data['rating'] + rating.rating) / barberRatingsDocumentsLength
    });
  }
}
