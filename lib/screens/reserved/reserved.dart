import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafefly/models/barbershopModel.dart';
import 'package:hafefly/models/barbers.dart';
import 'package:hafefly/models/rating.dart';
import 'package:hafefly/screens/home/homeWrappe.dart';
import 'package:hafefly/screens/widgets/mapWidget.dart';
import 'package:hafefly/services/database.dart';

// ignore: must_be_immutable
class ReservedPage extends StatelessWidget {
  ReservedPage({Key? key, required this.barber, required this.barbershop})
      : super(key: key);
  Barber barber;
  Barbershop barbershop;
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Radius bottom;
    if (width < 400) {
      bottom = const Radius.circular(15);
    } else {
      bottom = const Radius.circular(0);
    }
    Rating rating =
        Rating(userUID: uid, barberUID: barber.barberUID, rating: 1);
    return Scaffold(
      body: Container(
        width: width,
        height: height,
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
                  margin: EdgeInsets.only(top: height / 3 - 20),
                  height: height / 3,
                  color: const Color(0xff252d63),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ]),
                        child: Image.asset('assets/images/BarberAvatar.png'),
                      ),
                      Container(
                        height: height / 5,
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${barber.firstname} ${barber.lastname}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.phone_rounded,
                                    color: Colors.white),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    barber.phoneNumber,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/svg/instagram.svg"),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    barber.instagram,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height / 3,
                  width: width,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xc1161c41),
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Color(0xff394180),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Congrats',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          Image.asset('assets/images/saly.png')
                        ],
                      ),
                      const Text(
                        'Your barber has been notified of your coming',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                MapWidget(barbershop, Size(width, height)),
                Container(
                  width: width,
                  height: 70,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xc1161c41),
                      borderRadius:
                          BorderRadius.only(topLeft: bottom, topRight: bottom)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: Row(children: const [
                                    Icon(Icons.thumb_up),
                                    Text(' Please rate your barber',
                                        style: TextStyle(fontSize: 16))
                                  ]),
                                  content: RatingWidget(rating: rating),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeWrappePage()));
                                        },
                                        child: const Text('later')),
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeWrappePage()));
                                          await DatabaseService(uid: uid)
                                              .rateBarber(rating,
                                                  barbershop.barbershopUID);
                                        },
                                        child: const Text('rate')),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6)),
                          child: const Text(
                            ' Deal ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Row(
                                      children: [
                                        Image.asset(
                                            "assets/images/sad-face.png",
                                            width: 30),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text('no deal'),
                                        )
                                      ],
                                    ),
                                    content: const Text(
                                        'please email us what happened in your haircut journey with us, what can we do to make a better service. \ncontact us at: contact.raynmore@gmail.com'),
                                    elevation: 2,
                                    actions: [
                                      TextButton(
                                        onPressed: (() =>
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeWrappePage()))),
                                        child: const Text('Back Home'),
                                      )
                                    ],
                                  ),
                              barrierDismissible: true,
                              useRootNavigator: false);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6)),
                          child: const Text(
                            'noDeal',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RatingWidget extends StatefulWidget {
  const RatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final Rating rating;

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        RatingBar.builder(
            minRating: 1,
            itemBuilder: (context, _) => const Icon(Icons.star_rate_rounded),
            onRatingUpdate: (ratingVar) => setState(() {
                  widget.rating.rating = ratingVar;
                }))
      ],
    ));
  }
}
