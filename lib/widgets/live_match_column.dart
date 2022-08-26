import 'package:flutter/material.dart';

class LiveMatchColumn extends StatelessWidget {
  const LiveMatchColumn({
    Key? key,
    required this.image,
    required this.name,
    required this.isHome,
  }) : super(key: key);

  final String image;
  final String name;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 85,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          isHome ? "Home" : "Away",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }
}
