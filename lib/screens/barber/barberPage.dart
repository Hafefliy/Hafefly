// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/barbershopModel.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:hafefly/screens/barber/haircutPage.dart';

// ignore: must_be_immutable
class BarberPage extends StatelessWidget {
  BarberPage({Key? key, required this.barber, required this.barbershop}) : super(key: key);
  Barber barber;
  Barbershop barbershop;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double imageWidth;
    double imagePaddingTop;
    double secondCardTop;
    double secondCardHeight;

    if (width < 400) {
      imageWidth = 90;
      imagePaddingTop = 50;
      secondCardTop = 10;
      secondCardHeight = 70;
    } else {
      imageWidth = 110;
      imagePaddingTop = 100;
      secondCardTop = 20;
      secondCardHeight = 75;
    }
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: height / 3.3,
                  decoration: const BoxDecoration(
                      color: Color(0xff394180),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Row(
                  children: [
                    Hero(
                        tag: 'dash${barber.firstname}',
                        child: Container(
                            width: imageWidth,
                            margin: EdgeInsets.only(
                                top: imagePaddingTop, left: width / 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child:
                                Image.asset('assets/images/BarberImage2.png'))),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '${barber.firstname} ${barber.lastname}',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.schedule_rounded,
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    '${barber.experience} years of experience',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              barber.bio,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Text(
                                  barbershop.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: width / 7),
                                  child: Row(children: [
                                    const Icon(Icons.star_rounded,
                                        color: Colors.amberAccent),
                                    Text(
                                      '${barber.rating}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: secondCardTop,
                  top: secondCardTop),
              height: secondCardHeight,
              decoration: BoxDecoration(
                color: const Color(0xff394180),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            'Working Hours',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          barber.workingHours,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 100, child: Image.asset('assets/images/mower.png'))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: height / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff394180),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.thumb_up_rounded,
                              color: Colors.white,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text('Reviews',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: const Text('View all',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: width,
                height: 40,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Haircut(barber: barber, barbershop: barbershop)));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xffef9227))),
                  child: const Text(
                    'Book',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
