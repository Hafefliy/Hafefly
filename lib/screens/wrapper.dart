// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/authenticate.dart';
import '../models/user.dart';
import 'home/homeWrappe.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<Userr?>(context);
    if (user?.uid == null) {
      return const Authenticate();
    } else {
      print(user?.uid);
      print(user?.uid);
      return const HomeWrappePage();
    }
  }
}
