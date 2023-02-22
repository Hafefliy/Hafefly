import 'package:flutter/material.dart';
import 'package:hafefly/screens/authentication/final_sign_up.dart';

import '../../models/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  late UserData userInformation;
  String firstname = '';
  String lastname = '';
  String province = '';
  String phoneNumber = '';
  int age = 00;
  final _formKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double imageSize;
    double topMargin;
    double verificationTextSize;
    if (width < 400) {
      imageSize = 220;
      topMargin = 30;
      verificationTextSize = 11;
    } else {
      imageSize = 250;
      topMargin = 110;
      verificationTextSize = 13;
    }
    var maxWidthChild = SizedBox(
        width: width / 3 - 60,
        height: 64,
        child: Center(
          child: Text(
            'Send Verification',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: verificationTextSize),
          ),
        ));
    return Scaffold(
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: topMargin),
              width: imageSize,
              child: const Image(
                image: AssetImage('assets/images/Logo.png'),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width / 2 - 30,
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                firstname = val;
                              });
                            },
                            autocorrect: false,
                            validator: (val) =>
                                val!.length < 3 ? 'Enter your real name' : null,
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xff5680a7)),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff5680a7), width: 2.0),
                              ),
                              hintText: 'Firstname',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xff617282)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 2 - 30,
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                lastname = val;
                              });
                            },
                            autocorrect: false,
                            validator: (val) =>
                                val!.length < 3 ? 'Enter your real name' : null,
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xff5680a7)),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff5680a7), width: 2.0),
                              ),
                              hintText: 'Lastname',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xff617282)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 2 * width / 3 + 10,
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                province = val;
                              });
                            },
                            validator: (val) => val!.length < 4
                                ? 'Enter a valid province'
                                : null,
                            autocorrect: false,
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xff5680a7)),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff5680a7), width: 2.0),
                              ),
                              hintText: 'Province',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xff617282)),
                            ),
                          ),
                        ),
                        Container(
                          width: width / 3 - 60,
                          margin: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            onChanged: (val) {
                              setState(() {
                                age = int.parse(val);
                              });
                            },
                            validator: (val) =>
                                val!.length < 2 ? 'Enter your age' : null,
                            autocorrect: false,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xff5680a7)),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff5680a7), width: 2.0),
                              ),
                              hintText: 'Age',
                              hintStyle: TextStyle(
                                  fontSize: 20.0, color: Color(0xff617282)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: _phoneKey,
                          child: SizedBox(
                            width: 2 * width / 3 - 20,
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  phoneNumber = val;
                                });
                              },
                              validator: (val) => val!.length < 10
                                  ? 'Enter a valid phone number'
                                  : null,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 20, color: Color(0xff5680a7)),
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff5680a7), width: 2.0),
                                ),
                                hintText: 'Phone number',
                                hintStyle: TextStyle(
                                    fontSize: 20.0, color: Color(0xff617282)),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_phoneKey.currentState!.validate()) {
                              //TODO: implement phone verification;

                              // ignore: avoid_print
                              print('phone number is valid');
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff5680a7))),
                          child: maxWidthChild,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Didn\'t get verification code',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Color(0xffa9b3c6),
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                fontFamily: "SF Pro Display",
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    userInformation = UserData(0,
                        uid: '',
                        firstname: firstname,
                        lastname: lastname,
                        phoneNumber: phoneNumber,
                        province: province,
                        age: age,
                        instagram: 'unknown',
                        location: 'unkown',
                        vip: false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FinalSignUpPage(userInformation)),
                    );
                  }
                },
                style: ButtonStyle(
                    shadowColor:
                        MaterialStateProperty.all(const Color(0xff5680a7)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff5680a7)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                color: Color(0xff5680a7), width: 3)))),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
