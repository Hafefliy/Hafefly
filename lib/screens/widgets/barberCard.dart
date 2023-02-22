// ignore_for_file: avoid_print, file_names

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:hafefly/screens/barber/barberPage.dart';
import 'package:tcard/tcard.dart';

import '../../models/barbershopModel.dart' as bbp;

class Tinder extends StatefulWidget {
  final bbp.Barbershop barbershop;
  const Tinder({Key? key, required this.barbershop}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Tinder createState() => _Tinder();
}

class _Tinder extends State<Tinder> {
  // TODO: add infitie tinder like cards;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> cards = [];

    TCardController controller = TCardController();
    return Expanded(
      child: FirestoreBuilder<BarberQuerySnapshot>(
          ref: barbersRef.whereBarbershopUID(isEqualTo: widget.barbershop.barbershopUID),
          builder: (context, AsyncSnapshot<BarberQuerySnapshot> snapshot,
              Widget? child) {
            if (snapshot.hasError) return Text('${snapshot.error}');
            if (!snapshot.hasData) return const Text('Loading users...');

            BarberQuerySnapshot querySnapshot = snapshot.requireData;
            print(querySnapshot.docs.length);
            querySnapshot.docs.forEach(((element) {
              cards.add(BarberCard(
                  barber: element.data, barbershop: widget.barbershop));
            }));
            return Center(
                child: cards.isEmpty
                    ? const Text("We are recruting barbers!", style: TextStyle(fontSize: 22, color: Colors.white),)
                    : Stack(
                        children: [
                          TCard(
                            size: Size(width, height / 1.9),
                            cards: cards,
                            controller: controller,
                            onForward: (index, info) {
                              index = index;
                              setState(() {});
                            },
                            onBack: (index, info) {
                              setState(() {
                                index = index;
                              });
                            },
                            onEnd: () {
                              print('end');
                            },
                          ),
                        ],
                      ));
          }),
    );
  }
}

// ignore: must_be_immutable
class BarberCard extends StatelessWidget {
  BarberCard({Key? key, required this.barber, required this.barbershop})
      : super(key: key);
  Barber barber;
  bbp.Barbershop barbershop;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double containerHeight;
    double buttonRadius;
    double buttonFontSize;
    if (width < 400) {
      containerHeight = height / 2.1;
      buttonRadius = 7;
      buttonFontSize = 15;
    } else {
      containerHeight = height / 2.8;
      buttonRadius = 10;
      buttonFontSize = 24;
    }
    return Stack(
      children: [
        Container(
          height: containerHeight,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            color: const Color(0xff394180),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                    tag: 'dash${barber.firstname}',
                    child: Container(
                      margin: const EdgeInsets.only(left: 40, top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset('assets/images/BarberAvatar.png'),
                    )),
                SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 12, top: 20),
                            child: Text(
                              '${barber.firstname} ${barber.lastname}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 12, top: 5),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.schedule_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    '${barber.experience} years of exp',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        const Icon(Icons.star_rounded,
                            color: Colors.amberAccent),
                        Text(
                          '${barber.rating}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ]),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 40),
              child: const Text('Working Hours',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Text(barber.workingHours,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.white)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Text(barber.bio,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.white60)),
            ),
            Container(
              height: height / 18,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: SizedBox.expand(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.book_rounded),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BarberPage(
                                barber: barber, barbershop: barbershop)));
                  },
                  label: Text(
                    'Book',
                    style: TextStyle(fontSize: buttonFontSize),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffef9227)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius))),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
