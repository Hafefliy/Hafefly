// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafefly/models/order_model.dart';
import 'package:hafefly/services/database.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  ScrollController controller = ScrollController();
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Appointments",
                style: TextStyle(fontFamily: "rum-raising", fontSize: 30),
              ),
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
                child: SizedBox(
                  width: width,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          color: Color(0xff1f2769),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child: FirestoreBuilder<OrderQuerySnapshot>(
                                    ref: usersRef.doc(uid).orders,
                                    builder: (context,
                                        AsyncSnapshot<OrderQuerySnapshot>
                                            snapshot,
                                        Widget? child) {
                                      if (snapshot.hasError) {
                                        return const Text(
                                            'Something went wrong!');
                                      }
                                      if (!snapshot.hasData) {
                                        return const Center(child: CircularProgressIndicator());
                                      }
                                      OrderQuerySnapshot querySnapshot =
                                          snapshot.requireData;
                                      return ListView.separated(
                                          controller: controller,
                                          itemCount: querySnapshot.docs.length,
                                          separatorBuilder: (i, _) =>
                                              const Divider(),
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, int index) {
                                            Order order =
                                                querySnapshot.docs[index].data;
                                            return AppointmentWidget(
                                                order: order);
                                          });
                                    }))
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}

class AppointmentWidgetCollapsed extends StatefulWidget {
  const AppointmentWidgetCollapsed(
      {Key? key,
      required this.order,
      required this.barberfirstname,
      required this.barberlastname})
      : super(key: key);
  final Order order;
  final String barberfirstname;
  final String barberlastname;

  @override
  State<AppointmentWidgetCollapsed> createState() =>
      _AppointmentWidgetCollapsedState();
}

class _AppointmentWidgetCollapsedState
    extends State<AppointmentWidgetCollapsed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff1b1d30),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset("assets/images/avatar.png"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/svg/Time Circle.svg"),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                widget.order.time,
                                style: const TextStyle(
                                  color: Color(0xffe6e6e6),
                                  fontSize: 18,
                                  fontFamily: "SF Compact Rounded",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/svg/calendar2.svg"),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text(
                                widget.order.date,
                                style: const TextStyle(
                                  color: Color(0xffe6e6e6),
                                  fontSize: 18,
                                  fontFamily: "SF Compact Rounded",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                "${widget.barberfirstname} ${widget.barberlastname}",
                style: const TextStyle(
                  color: Color(0xffefefef),
                  fontSize: 24,
                  fontFamily: "SF Compact Rounded",
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widget.order.isCanceled
                  ? Stack(
                      children: [
                        const SizedBox(
                          width: 30,
                          height: 30,
                          child: Material(
                            color: Colors.red,
                            shape: CircleBorder(),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            top: 10,
                            child: SvgPicture.asset("assets/svg/cros.svg", width: 10)),
                      ],
                    )
                  : widget.order.isConfirmed
                      ? Stack(
                          children: [
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Material(
                                color: Color(0xff127e30),
                                shape: CircleBorder(),
                              ),
                            ),
                            Positioned(
                                left: 8,
                                top: 10,
                                child: SvgPicture.asset(
                                    "assets/svg/donemark.svg")),
                          ],
                        )
                      : Stack(
                          children: const [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Material(
                                color: Color.fromARGB(255, 82, 80, 80),
                                shape: CircleBorder(),
                              ),
                            ),
                            Positioned(
                                left: 12,
                                bottom: 5,
                                child: Text(
                                  "!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                )),
                          ],
                        ),
              widget.order.isAtHome
                  ? Stack(
                      children: [
                        const SizedBox(
                          width: 30,
                          height: 30,
                          child: Material(
                            color: Color(0xff22afc2),
                            shape: CircleBorder(),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          top: 5,
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: SvgPicture.asset("assets/svg/atHome.svg")),
                        ),
                      ],
                    )
                  : const SizedBox(width: 30, height: 30)
            ],
          ),
        )
      ]),
    );
  }
}

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  static bool isOpen = false;
  String? barberfirstname;
  String? barberlastname;
  bool isLoading = true;
  getBarber() async {
    CollectionReference barberCollection =
        FirebaseFirestore.instance.collection('barbers');
    DocumentSnapshot barberData =
        await barberCollection.doc(widget.order.barberUID).get();
    var data = barberData.data() as Map<String, dynamic>;
    setState(() {
      barberfirstname = data['firstname'];
      barberlastname = data['lastname'];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    getBarber();
    buildCollapsed1() {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: isLoading
              ? const CircularProgressIndicator()
              : AppointmentWidgetCollapsed(
                  order: widget.order,
                  barberfirstname: barberfirstname!,
                  barberlastname: barberlastname!,
                ));
    }

    String uid = FirebaseAuth.instance.currentUser!.uid;
    buildExpanded1() {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xff1b1d30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.asset(
                                          "assets/images/avatar.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/svg/Time Circle.svg"),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                child: Text(
                                                  widget.order.time,
                                                  style: const TextStyle(
                                                    color: Color(0xffe6e6e6),
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "SF Compact Rounded",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/svg/calendar2.svg"),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                child: Text(
                                                  widget.order.date,
                                                  style: const TextStyle(
                                                    color: Color(0xffe6e6e6),
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "SF Compact Rounded",
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "$barberfirstname $barberlastname",
                                  style: const TextStyle(
                                    color: Color(0xffefefef),
                                    fontSize: 24,
                                    fontFamily: "SF Compact Rounded",
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                widget.order.isCanceled
                                    ? Container(
                                        width: 90,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0))),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: SvgPicture.asset(
                                                      "assets/svg/cros.svg")),
                                              const SizedBox(width: 5),
                                              const Text('Canceled',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        "SF Compact Rounded",
                                                    fontWeight: FontWeight.w700,
                                                  ))
                                            ]))
                                    : widget.order.isConfirmed
                                        ? Container(
                                            width: 90,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                                color: Color(0xff127e30),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.0))),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: SvgPicture.asset(
                                                          "assets/svg/donemark.svg")),
                                                  const SizedBox(width: 5),
                                                  const Text('confirmed',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily:
                                                            "SF Compact Rounded",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ))
                                                ]))
                                        : Container(
                                            width: 90,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 82, 80, 80),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30.0))),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: Positioned(
                                                        left: 12,
                                                        bottom: 5,
                                                        child: Text(
                                                          "!",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        )),
                                                  ),
                                                  SizedBox(width: 7),
                                                  Text('TBC',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontFamily:
                                                            "SF Compact Rounded",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ))
                                                ])),
                                widget.order.isAtHome
                                    ? Container(
                                        width: 90,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff22afc2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0))),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: SvgPicture.asset(
                                                      "assets/svg/atHome.svg")),
                                              const SizedBox(width: 5),
                                              const Text('at home',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        "SF Compact Rounded",
                                                    fontWeight: FontWeight.w700,
                                                  ))
                                            ]))
                                    : const SizedBox(width: 30, height: 30)
                              ],
                            ),
                          )
                        ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                        height: 5, thickness: 4, color: Color(0xff1f2769)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Haircut order',
                                  style: TextStyle(
                                    color: Color(0xffbebebe),
                                    fontSize: 18,
                                    fontFamily: "SF Compact Rounded",
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text('price',
                                  style: TextStyle(
                                    color: Color(0xffbebebe),
                                    fontSize: 18,
                                    fontFamily: "SF Compact Rounded",
                                    fontWeight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Haircut',
                                  style: TextStyle(
                                    color: Color(0xffbebebe),
                                    fontSize: 18,
                                    fontFamily: "SF Compact Rounded",
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text('200DA',
                                  style: TextStyle(
                                    color: Color(0xffbebebe),
                                    fontSize: 18,
                                    fontFamily: "SF Compact Rounded",
                                    fontWeight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                        widget.order.isFade
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Fade',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('100DA',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.order.isBeard
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Beard',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('100DA',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.order.isRazor
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Razor',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('50DA',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.order.isScissors
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Scissors',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('50DA',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.order.isHairdryer
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Hairdryer',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('50DA',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.order.isStraitener
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Straitener',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('50DA',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        widget.order.isAtHome
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('at home',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('100DA',
                                        style: TextStyle(
                                          color: Color(0xffbebebe),
                                          fontSize: 18,
                                          fontFamily: "SF Compact Rounded",
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('total: ',
                                  style: TextStyle(
                                    color: Color(0xffbebebe),
                                    fontSize: 18,
                                    fontFamily: "SF Compact Rounded",
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text('${widget.order.price}DA',
                                  style: const TextStyle(
                                    color: Color(0xffbebebe),
                                    fontSize: 18,
                                    fontFamily: "SF Compact Rounded",
                                    fontWeight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
    }

    _showDialog() {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Row(
                  children: [
                    SvgPicture.asset("assets/svg/cros.svg", width: 30),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('Cancel Appoinment'),
                    )
                  ],
                ),
                content: const Text("Do you realy want to cancel your appointment"),
                elevation: 2,
                actions: [
                  TextButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: const Text('Back')),
                  TextButton(
                      onPressed: (() {
                        DatabaseService(uid: uid).cancelOrder(widget.order);
                        Navigator.pop(context);
                      }),
                      child: const Text('Confirm'))
                ],
              ),
          barrierDismissible: true,
          useRootNavigator: false);
    }

    ExpandableController expController = ExpandableController(
      initialExpanded: isOpen,
    );

    expController.addListener(() {
      isOpen = !isOpen;
    });

    return ExpandableNotifier(
        controller: expController,
        child: ScrollOnExpand(
          child: InkWell(
            onTap: () {
              expController.toggle();
            },
            onLongPress: _showDialog,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed1(),
                  expanded: buildExpanded1(),
                ),
              ],
            ),
          ),
        ));
  }
}
