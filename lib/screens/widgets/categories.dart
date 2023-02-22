// ignore_for_file: must_be_immutable, duplicate_ignore

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hafefly/models/CategoryModel.dart';
import 'package:hafefly/models/barbershopModel.dart' as bbp;
import 'package:hafefly/models/user.dart' as user;
import 'package:hafefly/screens/categories/categoryPage.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({Key? key, required this.index}) : super(key: key);
  int index;
  static user.BarbershopCollectionReference favoriteBarbershopsRef =
      user.usersRef.doc(CategoriesWidget.uid).favoriteBarbershops;

  List<Category> categories = [
    Category(
        name: 'Highest Rating',
        icon: Icons.star_rounded,
        color: Colors.amberAccent.shade700,
        ref: bbp.barbershopsRef.orderByRating(descending: true, endAt: 4.3)),
    Category(
        name: 'Nearby',
        icon: Icons.navigation_rounded,
        color: Colors.lightBlue.shade400,
        ref: bbp.barbershopsRef.whereLocation(isEqualTo: 'birkhadem')),
  ];
  static String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class CategoriesFWidget extends StatefulWidget {
  CategoriesFWidget({Key? key}) : super(key: key);
  static user.BarbershopCollectionReference favoriteBarbershopsRef =
      user.usersRef.doc(CategoriesWidget.uid).favoriteBarbershops;

  List<Category> categories = [
    Category(
        name: 'Favorites',
        icon: Icons.favorite_rounded,
        color: Colors.red.shade700,
        ref: user.usersRef.doc(uid).favoriteBarbershops),
  ];
  static String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  State<CategoriesFWidget> createState() => _CategoriesFWidgetState();
}

class _CategoriesFWidgetState extends State<CategoriesFWidget> {
  @override
  Widget build(BuildContext context) {
    Category category = widget.categories[0];

    final double categoryHeight = MediaQuery.of(context).size.height * 0.25;
    var width = MediaQuery.of(context).size.width;
    return FirestoreBuilder<user.BarbershopQuerySnapshot>(
        ref: CategoriesWidget.favoriteBarbershopsRef,
        builder: (context, AsyncSnapshot<user.BarbershopQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) return const Text('Something went wrong!');
          if (!snapshot.hasData) {
            return Container(
              width: width / 2.5,
              margin: const EdgeInsets.only(right: 20),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: category.color,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: const TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'unknown barbershops',
                            style: TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 7, left: 6, bottom: 6, right: 6),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child:
                          Icon(category.icon, color: category.color, size: 35))
                ],
              ),
            );
          }
          user.BarbershopQuerySnapshot querySnapshot = snapshot.requireData;
          return InkWell(
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                // add your code here.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryFPage(
                              category: category,
                            )));
              });
            },
            child: Container(
              width: width / 2.5,
              margin: const EdgeInsets.only(right: 20),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: category.color,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: const TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${querySnapshot.docs.length} barbershops',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 7, left: 6, bottom: 6, right: 6),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child:
                          Icon(category.icon, color: category.color, size: 35))
                ],
              ),
            ),
          );
        });
  }
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    Category category = widget.categories[widget.index];

    final double categoryHeight = MediaQuery.of(context).size.height * 0.25;
    var width = MediaQuery.of(context).size.width;
    return FirestoreBuilder<bbp.BarbershopQuerySnapshot>(
        ref: category.ref,
        builder: (context, AsyncSnapshot<bbp.BarbershopQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) return const Text('Something went wrong!');
          if (!snapshot.hasData) return const Text('Loading users...');
          bbp.BarbershopQuerySnapshot querySnapshot = snapshot.requireData;
          return InkWell(
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                // add your code here.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryPage(
                              category: category,
                            )));
              });
            },
            child: Container(
              width: width / 2.5,
              margin: const EdgeInsets.only(right: 20),
              height: categoryHeight,
              decoration: BoxDecoration(
                  color: category.color,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: const TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${querySnapshot.docs.length} barbershops',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 7, left: 6, bottom: 6, right: 6),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child:
                          Icon(category.icon, color: category.color, size: 35))
                ],
              ),
            ),
          );
        });
  }
}
