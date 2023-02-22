import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/user.dart';

import '../../../models/barbershopModel.dart' as bbp;
import '../../widgets/barbershopCard.dart';
import '../../widgets/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
        ),
      ),
      child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20, left: 20),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoriesFWidget(),
                  CategoriesWidget(index: 0),
                  CategoriesWidget(index: 1)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30),
          child: Row(
            children: const [
              Icon(Icons.local_activity_rounded, color: Colors.white),
              Padding(
                padding: EdgeInsets.only(left: 7),
                child: Text('ViP Barbershops',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
        Expanded(
            child: FirestoreBuilder(
                ref: bbp.barbershopsRef.whereVip(isEqualTo: true),
                builder: (context,
                    AsyncSnapshot<bbp.BarbershopQuerySnapshot> snapshot,
                    Widget? child) {
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          color: const Color(0xd63e457b),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(100),
                                blurRadius: 10.0),
                          ]),
                    );
                  }
                  bbp.BarbershopQuerySnapshot querySnapshot =
                      snapshot.requireData;
                  return ListView.builder(
                      controller: controller,
                      itemCount: querySnapshot.docs.length,
                      itemBuilder: (context, index) {
                        bbp.Barbershop barbershop =
                            querySnapshot.docs[index].data;
                        return FirestoreBuilder<BarbershopQuerySnapshot>(
                            ref: usersRef.doc(uid).favoriteBarbershops,
                            builder: (context,
                                AsyncSnapshot<BarbershopQuerySnapshot> snapshot,
                                Widget? child) {
                              if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              if (!snapshot.hasData) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0)),
                                      color: const Color(0xd63e457b),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(100),
                                            blurRadius: 10.0),
                                      ]),
                                );
                              }

                              BarbershopQuerySnapshot querySnapshott =
                                  snapshot.requireData;
                              if (querySnapshott.docs
                                  .contains(querySnapshot.docs[index])) {
                                barbershop.isLiked = true;
                              } else {
                                barbershop.isLiked = false;
                              }
                              return Align(
                                  alignment: Alignment.topCenter,
                                  child: snapshot.hasError
                                      ? Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20.0)),
                                              color: const Color(0xd63e457b),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withAlpha(100),
                                                    blurRadius: 10.0),
                                              ]),
                                          child: const Center(
                                            child: Text(
                                              'an error has occured please try again...',
                                              style:
                                                  TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        )
                                      : !snapshot.hasData
                                          ? Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              20.0)),
                                                  color:
                                                      const Color(0xd63e457b),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(100),
                                                        blurRadius: 10.0),
                                                  ]),
                                            )
                                          : BarbershopCard(
                                              barbershop: barbershop));
                            });
                      });
                })),
      ]),
    );
  }
}
