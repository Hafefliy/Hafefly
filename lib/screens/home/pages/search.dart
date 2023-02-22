// ignore_for_file: avoid_print

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafefly/models/barbershopModel.dart';
import 'package:hafefly/screens/widgets/barbershopCard.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  TextEditingController textController = TextEditingController();
  ScrollController controller = ScrollController();
  bool isLiked = false;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
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
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
            decoration: BoxDecoration(
                color: const Color(0xff394180),
                borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'search',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  icon: SvgPicture.asset("assets/svg/Search.svg")),
              controller: textController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
              child: FirestoreBuilder(
                  ref: barbershopsRef,
                  builder: (context,
                      AsyncSnapshot<BarbershopQuerySnapshot> snapshot,
                      Widget? child) {
                    if (snapshot.hasError) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            color: const Color(0xd63e457b),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  blurRadius: 10.0),
                            ]),
                        child: const Center(
                          child: Text(
                            'an error has occured please try again...',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            color: const Color(0xd63e457b),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  blurRadius: 10.0),
                            ]),
                        child: const Center(
                          child: CircularProgressIndicator()
                        ),
                      );
                    }
                    BarbershopQuerySnapshot querySnapshot =
                        snapshot.requireData;
                    return ListView.builder(
                        controller: controller,
                        itemCount: querySnapshot.docs.length,
                        itemBuilder: (context, index) {
                          Barbershop barbershop =
                              querySnapshot.docs[index].data;
                          return barbershop.name
                                  .toLowerCase()
                                  .contains(searchText.toLowerCase())
                              ? Align(
                                  alignment: Alignment.topCenter,
                                  child: BarbershopCard(barbershop: barbershop))
                              : Container();
                        });
                  })),
        ],
      ),
    );
  }
}
