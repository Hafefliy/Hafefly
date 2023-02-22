// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final height;
  final width;
  double radius = 20.0;
  ShimmerWidget.radius(
      {Key? key, required this.height, this.width, this.radius = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
        baseColor: const Color(0xd63e457b),
        highlightColor: const Color(0xff6570c0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          width: width,
          height: height,
        ));
  }
}
