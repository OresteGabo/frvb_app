import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CompetitionWidget extends StatelessWidget {
  const CompetitionWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.isSelected,
  }) : super(key: key);

  final String image;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: isSelected ? pinkColor : Colors.white),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            image,
            color: isSelected ? Colors.white : Colors.grey,
            height: 40,
            width: 40,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            name,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
