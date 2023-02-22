// ignore_for_file: file_names, must_be_immutable, avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafefly/services/database.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/user.dart';

class EditProfile extends StatefulWidget {
  String profilePicture;
  UserData user;
  EditProfile({Key? key, required this.user, required this.profilePicture})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    File? selectedImage;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "edit profile",
            style: TextStyle(fontFamily: "rum-raising", fontSize: 30),
          ),
          backgroundColor: const Color(0xff394180)),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff394180),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    image = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      selectedImage = File(image!.path);
                                    });
                                  },
                                  child: Center(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            spreadRadius: 11,
                                            blurRadius:
                                                4, // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/svg/Camera.svg',
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 44,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xff12173c),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'firstname',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 80,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            decoration: InputDecoration(
                                              hintText: widget.user.firstname,
                                              hintStyle: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            ),
                                            onChanged: (val) {
                                              setState(() {
                                                widget.user.firstname = val;
                                              });
                                            },
                                          )),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 44,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xff12173c),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'lastname',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 80,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            decoration: InputDecoration(
                                              hintText: widget.user.lastname,
                                              hintStyle: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            ),
                                            onChanged: (val) {
                                              setState(() {
                                                widget.user.lastname = val;
                                              });
                                            },
                                          )),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 44,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xff12173c),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'phoneNumber',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Form(
                                        key: _phoneKey,
                                        child: SizedBox(
                                            width: 80,
                                            child: TextFormField(
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                              decoration: InputDecoration(
                                                hintText: widget.user.phoneNumber,
                                                hintStyle: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Color(0xff617282)),
                                              ),
                                              onChanged: (val) {
                                                setState(() {
                                                  widget.user.phoneNumber = val;
                                                });
                                              },
                                            )),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 44,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xff12173c),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'instagram',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 80,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            decoration: InputDecoration(
                                              hintText: widget.user.instagram,
                                              hintStyle: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            ),
                                            onChanged: (val) {
                                              setState(() {
                                                widget.user.instagram = val;
                                              });
                                            },
                                          )),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 44,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xff12173c),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'province',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 80,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            decoration: InputDecoration(
                                              hintText: widget.user.province,
                                              hintStyle: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            ),
                                            onChanged: (val) {
                                              setState(() {
                                                widget.user.province = val;
                                              });
                                            },
                                          )),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 44,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xff12173c),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'age',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 80,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            decoration: InputDecoration(
                                              hintText: widget.user.age.toString(),
                                              hintStyle: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            ),
                                            onChanged: (val) {
                                              setState(() {
                                                widget.user.age = int.parse(val);
                                              });
                                            },
                                          )),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              height: 44,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xff12173c),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'location',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 80,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            decoration: InputDecoration(
                                              hintText: widget.user.location,
                                              hintStyle: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Color(0xff617282)),
                                            ),
                                            onChanged: (val) {
                                              setState(() {
                                                widget.user.location = val;
                                              });
                                            },
                                          )),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          height: 44,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff12173c),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'VIP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  CupertinoSwitch(
                                      value: widget.user.vip,
                                      activeColor: CupertinoColors.activeGreen,
                                      onChanged: (bool newValue) {
                                        showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                                  title: Row(
                                                    children: [
                                                      Image.asset(
                                                          "assets/images/cib.png",
                                                          width: 30),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8),
                                                        child: Text('CiB card'),
                                                      )
                                                    ],
                                                  ),
                                                  content: const Text(
                                                      'we are working hard to add CiB cards, please give us a moment.'),
                                                  elevation: 2,
                                                  actions: [
                                                    TextButton(
                                                        onPressed: (() =>
                                                            Navigator.pop(
                                                                context)),
                                                        child: const Text('OK'))
                                                  ],
                                                ),
                                            barrierDismissible: true,
                                            useRootNavigator: false);
                                        setState(() {
                                          //TODO: add implementaion of CiB card and toggle here;
                                          widget.user.vip = false;
                                        });
                                      }),
                                ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ElevatedButton(
                  onPressed: () {
                    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                        .updateUserData(widget.user);
                    // if (image != null) {
                    //   await locator
                    //       .get<UserController>()
                    //       .uploadProfilePicture(selectedImage!);
                    // }
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xffef9227))),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
