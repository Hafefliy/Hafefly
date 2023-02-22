// ignore_for_file: file_names, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/services/database.dart';
import 'dart:math';

import '../../models/barbershopModel.dart';
import '../../models/barbers.dart';
import '../../models/haircutModels.dart';
import '../../models/order_model.dart';
import '../reserved/reserved.dart';
import '../widgets/haircutCard.dart';

// ignore: must_be_immutable
class Haircut extends StatefulWidget {
  Haircut({Key? key, required this.barber, required this.barbershop})
      : super(key: key);
  Barber barber;
  Barbershop barbershop;

  @override
  State<Haircut> createState() => _HaircutState();
}

class _HaircutState extends State<Haircut> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Order? order;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random _rnd = Random();
  static String getRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  String orderUID = getRandomString(20);

  int total = 200;

  @override
  Widget build(BuildContext context) {
    List<HaircutModel> haircuts = [
      HaircutModel(
          name: 'Fade', price: widget.barbershop.fade, isSelected: false),
      HaircutModel(
          name: 'Razor', price: widget.barbershop.razor, isSelected: false),
      HaircutModel(
          name: 'Scissors',
          price: widget.barbershop.scissors,
          isSelected: false),
      HaircutModel(
          name: 'Beard', price: widget.barbershop.beard, isSelected: false),
      HaircutModel(
          name: 'Hairdryer',
          price: widget.barbershop.hairdryer,
          isSelected: false),
      HaircutModel(
          name: 'Straightener',
          price: widget.barbershop.straightener,
          isSelected: false),
      HaircutModel(name: 'atHome', price: 100, isSelected: false)
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book',
          style: TextStyle(fontFamily: "rum-raising", fontSize: 30),
        ),
        backgroundColor: const Color(0xff394180),
      ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: const Text('Choose Your haircut :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(haircuts.length, (index) {
                return InkWell(
                    onTap: () {
                      if (haircuts[index].isSelected) {
                        setState(() {
                          total -= haircuts[index].price;
                          haircuts[index].isSelected = false;
                          print(total);
                        });
                      } else {
                        setState(() {
                          total += haircuts[index].price;
                          haircuts[index].isSelected = true;
                          print(total);
                        });
                      }
                    },
                    child: HaircutCard(haircut: haircuts[index], total: total));
              }),
            )),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff394180),
                  ),
                  child: Text('your total is: $total DA',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )),
                ),
                Container(
                    width: width,
                    height: height / 18,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          order = Order(
                              userUID: uid,
                              barberUID: widget.barber.barberUID,
                              isCanceled: false,
                              isPayed: false, //TODO: implement payment here;
                              isConfirmed: false,
                              isFade: haircuts[0].isSelected,
                              isRazor: haircuts[1].isSelected,
                              isScissors: haircuts[2].isSelected,
                              isBeard: haircuts[3].isSelected,
                              isHairdryer: haircuts[4].isSelected,
                              isStraitener: haircuts[5].isSelected,
                              isAtHome: haircuts[6].isSelected,
                              price: total,
                              orderUID: orderUID,
                              barbershopUID: widget.barbershop.barbershopUID,
                              date: 'TBC',
                              time: 'TBC');
                        });
                        if (order != null) {
                          await DatabaseService(uid: uid).addOrder(order!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReservedPage(
                                        barber: widget.barber,
                                        barbershop: widget.barbershop,
                                      )));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffef9227))),
                      child: const Text(
                        'Book',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
