import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafefly/models/user.dart';
import 'package:hafefly/screens/editProfile/editProfile.dart';
import 'package:hafefly/screens/widgets/avatar.dart';
import 'package:hafefly/services/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();
  String uid = FirebaseAuth.instance.currentUser!.uid;

  String profilePicture = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double containerHeight;
    if (width < 400) {
      containerHeight = height / 3;
    } else {
      containerHeight = height / 2.7;
    }
    return FirestoreBuilder<UserDataDocumentSnapshot>(
        ref: usersRef.doc(uid),
        builder: (context, AsyncSnapshot<UserDataDocumentSnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) {
            return const Text(
              'Something went wrong!',
              style: TextStyle(color: Colors.white),
            );
          }
          if (!snapshot.hasData) {
            return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff191b2c),
                      Color(0xff191c31),
                      Color(0xff192270)
                    ],
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, containerHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff394180),
                  ),
                ));
          }

          UserDataDocumentSnapshot documentSnapshot = snapshot.requireData;

          if (!documentSnapshot.exists) {
            return const Text('User does not exist.');
          }

          UserData user = documentSnapshot.data!;
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff191b2c),
                  Color(0xff191c31),
                  Color(0xff192270)
                ],
              ),
            ),
            child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, containerHeight),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff394180),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2.0, color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: AvatarP(
                                avatarUrl: profilePicture.isEmpty
                                    ? 'https://firebasestorage.googleapis.com/v0/b/hafefly-android.appspot.com/o/avatar.png?alt=media&token=a863fc44-fae5-486e-a396-4315caa97e69'
                                    : profilePicture,
                                onTap: () {},
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '${user.firstname} ${user.lastname}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.phone, color: Colors.white),
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    user.phoneNumber,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/instagram.svg"),
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    user.instagram,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.beenhere_rounded,
                                  color: Colors.white),
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "haircuts done: ${user.haircutsDone}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.only(right: 15, top: 10),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(22)),
                                child: IconButton(
                                  iconSize: 18,
                                  color: Colors.white,
                                  icon: const Icon(Icons.border_color_rounded),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile(
                                                user: user,
                                                profilePicture: profilePicture,
                                              )),
                                    );
                                  },
                                )),
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 15, bottom: 10),
                              child: TextButton.icon(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.red[600]),
                                ),
                                icon: const Icon(Icons.logout_rounded),
                                label: const Text('logout'),
                                onPressed: () async {
                                  await _auth.signout();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          );
        });
  }
}
