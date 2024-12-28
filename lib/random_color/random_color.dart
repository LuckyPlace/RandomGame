import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';
import 'package:random_game/random_color/color_result_page.dart';
import 'package:random_game/random_color/random_color_body.dart';

class RandomColor extends StatelessWidget {
  List<String> result = [];

  RandomColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNormalBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNormalBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: kArrowLeftIcon,
        ),
        title: const Text(
          'Random Color',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColorResultPage(
                    result: result,
                  ),
                ),
              );
            },
            icon: kResultIcon,
          ),
        ],
      ),
      body: RandomColorBody(
        randomColor: this,
      ),
    );
  }
}
