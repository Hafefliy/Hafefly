// ignore_for_file: file_names

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/CategoryModel.dart';
import 'package:hafefly/models/barbershopModel.dart';
import 'package:hafefly/models/user.dart' as user;
import 'package:hafefly/screens/widgets/barbershopCard.dart';

// ignore: must_be_immutable
class CategoryPage extends StatefulWidget {
  final Category category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class CategoryFPage extends StatefulWidget {
  final Category category;

  const CategoryFPage({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryFPage> createState() => _CategoryFPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  ScrollController controller = ScrollController();

  bool closeTopContainer = false;

  double topContainer = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.category.name,
            style: const TextStyle(fontFamily: "rum-raising", fontSize: 30),
          ),
          backgroundColor: widget.category.color,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
            ),
          ),
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1b2370),
                    Color(0xf31b2370),
                    Color(0x001a2270)
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: FirestoreBuilder<BarbershopQuerySnapshot>(
                          ref: widget.category.ref,
                          builder: (context,
                              AsyncSnapshot<BarbershopQuerySnapshot> snapshot,
                              Widget? child) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong!');
                            }
                            if (!snapshot.hasData) {
                              return const Text('Loading users...');
                            }
                            BarbershopQuerySnapshot querySnapshot =
                                snapshot.requireData;
                            return ListView.builder(
                                controller: controller,
                                itemCount: querySnapshot.docs.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  Barbershop barbershop =
                                      querySnapshot.docs[index].data;
                                  return FirestoreBuilder<
                                          user.BarbershopQuerySnapshot>(
                                      ref: user.usersRef
                                          .doc(uid)
                                          .favoriteBarbershops,
                                      builder: (context,
                                          AsyncSnapshot<
                                                  user.BarbershopQuerySnapshot>
                                              snapshot,
                                          Widget? child) {
                                        if (snapshot.hasError) {
                                          return const Text(
                                              'Something went wrong!');
                                        }
                                        if (!snapshot.hasData) {
                                          return const Text('Loading users...');
                                        }

                                        user.BarbershopQuerySnapshot
                                            querySnapshott =
                                            snapshot.requireData;
                                        if (querySnapshott.docs.contains(
                                            querySnapshot.docs[index])) {
                                          barbershop.isLiked = true;
                                        } else {
                                          barbershop.isLiked = false;
                                        }
                                        return Align(
                                            alignment: Alignment.topCenter,
                                            child: snapshot.hasError
                                                ? const Text(
                                                    'an error has occured please try again...')
                                                : !snapshot.hasData
                                                    ? const Text(
                                                        'Loading data...')
                                                    : BarbershopCard(
                                                        barbershop:
                                                            barbershop));
                                      });
                                });
                          })),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(5),
              child: Icon(
                widget.category.icon,
                color: widget.category.color,
                size: 40,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class _CategoryFPageState extends State<CategoryFPage> {
  ScrollController controller = ScrollController();

  bool closeTopContainer = false;

  double topContainer = 0;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.category.name,
            style: const TextStyle(fontFamily: "rum-raising", fontSize: 30),
          ),
          backgroundColor: widget.category.color,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
            ),
          ),
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1b2370),
                    Color(0xf31b2370),
                    Color(0x001a2270)
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: FirestoreBuilder<user.BarbershopQuerySnapshot>(
                          ref: widget.category.ref,
                          builder: (context,
                              AsyncSnapshot<user.BarbershopQuerySnapshot>
                                  snapshot,
                              Widget? child) {
                            if (snapshot.hasError) {
                              return const Text('Something went wrong!');
                            }
                            if (!snapshot.hasData) {
                              return const Text('Loading users...');
                            }
                            user.BarbershopQuerySnapshot querySnapshot =
                                snapshot.requireData;
                            return ListView.builder(
                                controller: controller,
                                itemCount: querySnapshot.docs.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  Barbershop barbershop =
                                      querySnapshot.docs[index].data;
                                  return FirestoreBuilder<
                                          user.BarbershopQuerySnapshot>(
                                      ref: user.usersRef
                                          .doc(uid)
                                          .favoriteBarbershops,
                                      builder: (context,
                                          AsyncSnapshot<
                                                  user.BarbershopQuerySnapshot>
                                              snapshot,
                                          Widget? child) {
                                        if (snapshot.hasError) {
                                          return const Text(
                                              'Something went wrong!');
                                        }
                                        if (!snapshot.hasData) {
                                          return const Text('Loading users...');
                                        }

                                        user.BarbershopQuerySnapshot
                                            querySnapshott =
                                            snapshot.requireData;
                                        if (querySnapshott.docs.contains(
                                            querySnapshot.docs[index])) {
                                          barbershop.isLiked = true;
                                        } else {
                                          barbershop.isLiked = false;
                                        }
                                        return Align(
                                            alignment: Alignment.topCenter,
                                            child: snapshot.hasError
                                                ? const Text(
                                                    'an error has occured please try again...')
                                                : !snapshot.hasData
                                                    ? const Text(
                                                        'Loading data...')
                                                    : BarbershopCard(
                                                        barbershop:
                                                            barbershop));
                                      });
                                });
                          })),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(5),
              child: Icon(
                widget.category.icon,
                color: widget.category.color,
                size: 40,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
