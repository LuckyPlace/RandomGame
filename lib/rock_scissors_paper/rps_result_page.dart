import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';

import '../reusable_container.dart';

class RPSResultPage extends StatelessWidget {
  List<String>? result = [];

  RPSResultPage({this.result});

  ReusableContainerSmall emptyResult() {
    return ReusableContainerSmall(
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          '보여줄 결과가 없습니다.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  List<Padding> showResultList() {
    // constructor를 통해 받아온 result를 카드의 형태로 출력한다.
    List<Padding> list = [];
    for (int i = 0; i < result!.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReusableContainerSmall(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  result![i],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNormalBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: kArrowLeftIcon,
        ),
        backgroundColor: kNormalBackgroundColor,
        title: const Text(
          'RPS Result Page',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: result!.isEmpty
            ? emptyResult()
            : ListView(
                children: showResultList(),
              ),
      ),
    );
  }
}
