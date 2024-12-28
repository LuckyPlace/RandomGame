import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_game/constants.dart';
import 'package:random_game/rock_scissors_paper/rock_scissors_paper_body.dart';
import 'package:random_game/rock_scissors_paper/rps_result_page.dart';
import '../reusable_button.dart';
import '../reusable_container.dart';

class RockScissorsPaper extends StatelessWidget {
  List<String> result = [];
  int seconds = 3; // 랜덤으로 돌아가는 초
  int tempSeconds = 3;

  RockScissorsPaper({super.key});

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
          'Rock Scissors Paper',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RPSResultPage(
                  result: result,
                );
              }));
            },
            icon: kResultIcon,
          ),
        ],
      ),
      body: RockScissorsPaperBody(
        rockScissorsPaper: this,
      ),
    );
  }
}
