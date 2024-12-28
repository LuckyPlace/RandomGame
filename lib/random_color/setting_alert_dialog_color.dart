import 'package:flutter/material.dart';
import 'package:random_game/random_color/random_color.dart';
import 'package:random_game/random_color/random_color_body.dart';

import '../constants.dart';

class SettingAlertDialogColor extends StatefulWidget {
  RandomColorBody randomColorBody;

  SettingAlertDialogColor({required this.randomColorBody});

  @override
  State<SettingAlertDialogColor> createState() =>
      _SettingAlertDialogColorState();
}

class _SettingAlertDialogColorState extends State<SettingAlertDialogColor> {
  bool errorFlag = false;

  InputDecoration onError() {
    return const InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      labelText: 'Error',
      labelStyle: TextStyle(
        color: Colors.red,
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      hintText: '0-9',
      helperStyle: TextStyle(
        color: Colors.white,
      ),
    );
  }

  // 정상 입력인 경우
  InputDecoration onNormal() {
    return const InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: kCircleBackgroundColor,
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      hintText: '0-9',
      helperStyle: TextStyle(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kCardBackgroundColor,
      title: const Text(
        'Setting',
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Duration: '),
            SizedBox(
              width: 80,
              child: TextField(
                decoration: errorFlag ? onError() : onNormal(),
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (String str) {
                  if (str.isNotEmpty) {
                    widget.randomColorBody.tempSeconds = int.parse(str);
                  }
                  if (widget.randomColorBody.tempSeconds >= 0 &&
                      widget.randomColorBody.tempSeconds <= 9) {
                    setState(() {
                      errorFlag = false;
                    });
                  } else {
                    // 0-9 이외의 다른 것을 입력했을 경우
                    // TODO 숫자가 아닌 character를 입력했을 경우에도 error가 떠야함
                    setState(() {
                      errorFlag = true;
                    });
                  }
                },
              ),
            ),
            const Text('second(s)'),
          ],
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              widget.randomColorBody.seconds =
                  widget.randomColorBody.tempSeconds;
              Navigator.pop(context);
            },
            child: const Text(
              'Done',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
