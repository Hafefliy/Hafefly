import 'package:flutter/material.dart';


class AvatarP extends StatelessWidget {
  const AvatarP({Key? key, required this.avatarUrl, required this.onTap}) : super(key: key);

  final String avatarUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(avatarUrl),
        ),
      ),
    );
  }
}
