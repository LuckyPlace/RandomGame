import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';
import 'package:random_game/random_color/random_color.dart';
import 'package:random_game/random_color/setting_alert_dialog_color.dart';
import 'package:vibration/vibration.dart';
import '../reusable_button.dart';
import '../reusable_container.dart';

class RandomColorBody extends StatefulWidget {
  RandomColor randomColor;
  int tempSeconds = 3;
  int seconds = 3;

  RandomColorBody({required this.randomColor});

  @override
  State<RandomColorBody> createState() => _RandomColorBodyState();
}

class _RandomColorBodyState extends State<RandomColorBody> {
  String currColor = '#202124';
  int stringToHexadecimalInt = 0xFF202124;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: ReusableContainerLarge(
              borderColor: Colors.black,
              backgroundColor: Color(stringToHexadecimalInt),
              child: Center(
                child: Text(
                  currColor,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableButton(
                    onPressed: () {
                      int count = widget.seconds * 20;
                      Timer.periodic(const Duration(milliseconds: 50), (timer) {
                        int red1 = Random().nextInt(16);
                        int red2 = Random().nextInt(16);
                        int green1 = Random().nextInt(16);
                        int green2 = Random().nextInt(16);
                        int blue1 = Random().nextInt(16);
                        int blue2 = Random().nextInt(16);
                        String R1 = red1.toRadixString(16).toUpperCase();
                        String R2 = red2.toRadixString(16).toUpperCase();
                        String G1 = green1.toRadixString(16).toUpperCase();
                        String G2 = red2.toRadixString(16).toUpperCase();
                        String B1 = blue1.toRadixString(16).toUpperCase();
                        String B2 = red2.toRadixString(16).toUpperCase();
                        String temp = 'FF$R1$R2$G1$G2$B1$B2';
                        count--;
                        Vibration.vibrate(duration: 10);
                        setState(() {
                          currColor = '#$R1$R2$G1$G2$B1$B2';
                        });
                        if (count <= 0) {
                          widget.randomColor.result.add(currColor);
                          setState(() {
                            stringToHexadecimalInt = int.parse(temp, radix: 16);
                          });
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
                  width: 10.0,
                ),
                ReusableButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => SettingAlertDialogColor(
                      randomColorBody: widget,
                    ),
                  ),
                  child: kSettingIcon,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
