import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';
import 'package:random_game/reusable_container.dart';

class ResultPage extends StatefulWidget {
  Map<String?, String?>? result = {};
  ResultPage({this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<Padding> showResultList() {
    // constructor를 통해 받아온 result Map의 key와 value를 list로 바꾼다.
    List<String?> keyList = widget.result!.keys.toList();
    List<String?> valueList = widget.result!.values.toList();
    List<Padding> list = [];
    for (int i = 0; i < widget.result!.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReusableContainerSmall(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${keyList[i]}     ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                  ),
                  Text(
                    '     ${valueList[i]}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNormalBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Result Page',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        backgroundColor: kNormalBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.result!.isEmpty
            ? emptyResult()
            : ListView(
                children: showResultList(),
              ),
      ),
    );
  }
}
