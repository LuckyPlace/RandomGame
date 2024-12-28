import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_game/rock_scissors_paper/rock_scissors_paper.dart';
import 'package:random_game/rock_scissors_paper/setting_alert_dialog_rsp.dart';
import 'package:vibration/vibration.dart';
import '../constants.dart';
import '../reusable_button.dart';
import '../reusable_container.dart';

class RockScissorsPaperBody extends StatefulWidget {
  RockScissorsPaper rockScissorsPaper;

  RockScissorsPaperBody({required this.rockScissorsPaper});

  @override
  State<RockScissorsPaperBody> createState() => _RockScissorsPaperBodyState();
}

class _RockScissorsPaperBodyState extends State<RockScissorsPaperBody> {
  List<String> emojis = ['\u{270A}', '\u{270B}', '\u{270C}'];
  List<String> texts = ['Rock', 'Paper', 'Scissors'];
  String currEmoji = '';
  String currText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: ReusableContainerLarge(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currEmoji,
                    style: const TextStyle(
                      fontSize: 100.0,
                    ),
                  ),
                  Text(
                    currText,
                    style: const TextStyle(
                      fontSize: 90.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableButton(
                    onPressed: () {
                      int count = widget.rockScissorsPaper.seconds * 20;
                      Timer.periodic(Duration(milliseconds: 50), (timer) {
                        int index = Random().nextInt(3);
                        count--;
                        Vibration.vibrate(duration: 10);
                        setState(() {
                          currEmoji = emojis[index];
                          currText = texts[index];
                        });
                        if (count <= 0) {
                          widget.rockScissorsPaper.result.add(currText);
                          Vibration.vibrate(duration: 100);
                          timer.cancel();
                        }
                      });
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ReusableButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => SettingAlertDialogRSP(
                      rockScissorsPaper: widget.rockScissorsPaper,
                    ),
                  ),
                  child: kSettingIcon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
