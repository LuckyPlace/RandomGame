import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';

import 'coin_flip_body.dart';
import 'coin_result_page.dart';

class CoinFlip extends StatelessWidget {
  CoinFlip({super.key});

  int tempSeconds = 3;
  int seconds = 3;
  String displayingText = '';
  List<String> coinSide = ['앞면', '뒷면'];
  List<String> result = [];

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
            icon: kArrowLeftIcon),
        title: const Text(
          'Coin Flip',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CoinResultPage(
                  result: result,
                );
              }));
            },
            icon: kResultIcon,
          ),
        ],
      ),
      body: SafeArea(
        child: CoinFlipBody(
          coinFlip: this,
        ),
      ),
    );
  }
}
