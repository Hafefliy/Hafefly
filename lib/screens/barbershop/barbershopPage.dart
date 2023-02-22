// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hafefly/models/barbershopModel.dart';
import 'package:hafefly/screens/widgets/barberCard.dart';
import 'package:hafefly/screens/widgets/mapWidget.dart';

class BarbershopPage extends StatelessWidget {
  const BarbershopPage({Key? key, required this.barbershop}) : super(key: key);
  final Barbershop barbershop;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget appBarTitle;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double imageHeight;
    if (width < 400) {
      imageHeight = height / 4;
    } else {
      imageHeight = height / 3.5;
    }

    if (barbershop.vip) {
      appBarTitle = Container(
        margin: EdgeInsets.only(right: width / 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.verified_rounded, color: Colors.white),
            ),
            Text(barbershop.name,
                style:
                    const TextStyle(fontFamily: "rum-raising", fontSize: 30)),
          ],
        ),
      );
    } else {
      appBarTitle = Text(barbershop.name,
          style: const TextStyle(fontFamily: "rum-raising", fontSize: 30));
    }
    return Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          backgroundColor: const Color(0xff394180),
        ),
        body: Container(
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
              width: width,
              decoration: const BoxDecoration(color: Color(0xff1b2371)),
              child: Column(
                children: [
                  SizedBox(
                    height: imageHeight,
                    width: width,
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset(
                          "assets/images/${barbershop.name}x2.png",
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MapWidget(
                                                  barbershop,
                                                  Size(size.width - 40,
                                                      size.height - 40))));
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    iconSize: 40,
                                    color: Colors.blueAccent,
                                    icon: const Icon(
                                      Icons.navigation_rounded,
                                      color: Colors.white,
                                    )),
                                Text(
                                  barbershop.location,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: const Icon(Icons.star_rounded,
                                      color: Colors.amberAccent),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Text('${barbershop.rating}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Tinder(barbershop: barbershop),
                ],
              ),
            )));
  }
}
