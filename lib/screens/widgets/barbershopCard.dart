// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hafefly/models/barbershopModel.dart';
import 'package:hafefly/screens/barbershop/barbershopPage.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:hafefly/screens/widgets/mapWidget.dart';
import 'package:hafefly/services/database.dart';

// ignore: must_be_immutable
class BarbershopCard extends StatefulWidget {
  const BarbershopCard({Key? key, required this.barbershop}) : super(key: key);
  final Barbershop barbershop;

  @override
  State<BarbershopCard> createState() => _BarbershopCardState();
}

class _BarbershopCardState extends State<BarbershopCard> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  //FIXME: LIKE BUTTON BEHAVES STRANGELY;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: const Color(0xd63e457b),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BarbershopPage(
                          barbershop: widget.barbershop,
                        )));
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Text(
                          widget.barbershop.name,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Rubik"),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Icons.place,
                              size: 15,
                              color: Color(0xFFD6D6D6),
                            ),
                            Text(
                              widget.barbershop.location,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFFD6D6D6),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent[400],
                                size: 17,
                              ),
                              Text(
                                '${widget.barbershop.rating}',
                                style: const TextStyle(
                                    fontSize: 15, color: Color(0xFFD6D6D6)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [Colors.black, Colors.transparent],
                              ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: Image.asset(
                              "assets/images/${widget.barbershop.name}.png",
                            ),
                          ),
                          Column(
                            children: [
                              widget.barbershop.isLiked
                                  ? Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Center(
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () async {
                                            await DatabaseService(uid: uid)
                                                .removeFavoriteBarbershop(
                                                    widget.barbershop);
                                            setState(() {
                                              widget.barbershop.isLiked = false;
                                            });
                                          },
                                          icon:
                                              const Icon(SFSymbols.heart_fill),
                                          color: Colors.white,
                                        ),
                                      ))
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Center(
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () async {
                                            await DatabaseService(uid: uid)
                                                .addFavoriteBarbershop(
                                                    widget.barbershop);
                                            setState(() {
                                              widget.barbershop.isLiked = true;
                                            });
                                          },
                                          icon:
                                              const Icon(SFSymbols.heart_fill),
                                          color: Colors.redAccent,
                                        ),
                                      )),
                              Center(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, bottom: 10),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Center(
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MapWidget(
                                                          widget.barbershop,
                                                          Size(
                                                              size.width - 40,
                                                              size.height -
                                                                  40))));
                                        },
                                        icon: const Icon(
                                            Icons.navigation_rounded),
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
