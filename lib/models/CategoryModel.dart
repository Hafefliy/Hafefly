// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Category {
  String name;
  IconData icon;
  Color color;
  var ref;

  Category(
      {required this.name,
      required this.icon,
      required this.color,
      required this.ref});
}
