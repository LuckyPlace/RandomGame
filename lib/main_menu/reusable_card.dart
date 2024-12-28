import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';

class ReusableCard extends StatelessWidget {
  final IconData? iconData;
  final String gameName;
  final double iconSize;

  ReusableCard({this.iconData, this.gameName = '', this.iconSize = 25.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCardBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: kCircleBackgroundColor,
              child: Icon(
                iconData,
                color: Colors.white,
                size: iconSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
            child: Text(
              gameName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
