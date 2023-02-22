// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hafefly/models/haircutModels.dart';

// ignore: must_be_immutable
class HaircutCard extends StatefulWidget {
  HaircutCard({Key? key, required this.haircut, required this.total})
      : super(key: key);
  HaircutModel haircut;
  int total = 200;

  @override
  State<HaircutCard> createState() => _HaircutCardState();
}

class _HaircutCardState extends State<HaircutCard> {
  @override
  Widget build(BuildContext context) {
    List<Color> myColors = [Colors.black, Colors.amber];
    return Center(
        child: Stack(
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xff394180),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:
                        widget.haircut.isSelected ? myColors[1] : myColors[0],
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                child: Image.asset('assets/images/${widget.haircut.name}.png'),
              ),
            ),
            SizedBox(
              width: 140,
              height: 140,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5, right: 10),
                        decoration: BoxDecoration(
                            color: const Color(0x3d6c7cff),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 10),
                        child: Text('+${widget.haircut.price}DA',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 75, left: 10),
                        decoration: BoxDecoration(
                            color: const Color(0x3d6c7cff),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(6),
                        child: Text(widget.haircut.name,
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
