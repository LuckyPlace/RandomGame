import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_game/coin_flip/setting_alert_dialog_coin.dart';
import 'package:vibration/vibration.dart';
import '../constants.dart';
import '../reusable_button.dart';
import '../reusable_container.dart';
import 'coin_flip.dart';

class CoinFlipBody extends StatefulWidget {
  CoinFlip coinFlip;
  CoinFlipBody({required this.coinFlip});

  @override
  State<CoinFlipBody> createState() => _CoinFlipBodyState();
}

class _CoinFlipBodyState extends State<CoinFlipBody> {
  bool isTimerCanceled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ReusableContainerLarge(
              child: Center(
                child: Text(
                  widget.coinFlip.displayingText,
                  style: kMainContainerTextStyle,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableButton(
                    onPressed: () {
                      int resultIndex = Random().nextInt(2);
                      String currResult = widget.coinFlip.coinSide[resultIndex];
                      widget.coinFlip.result.add(currResult);
                      int counter = widget.coinFlip.seconds * 20;
                      int index = 0;
                      Timer.periodic(const Duration(milliseconds: 50), (timer) {
                        setState(() {
                          widget.coinFlip.displayingText =
                              widget.coinFlip.coinSide[index];
                        });
                        if (index == 0) {
                          index = 1;
                        } else if (index == 1) {
                          index = 0;
                        }
                        Vibration.vibrate(duration: 10);
                        counter--;
                        if (counter <= 0) {
                          Vibration.vibrate(duration: 100);
                          isTimerCanceled = true;
                          timer.cancel();
                        }
                      });

                      Timer.periodic(const Duration(milliseconds: 100),
                          (timer) {
                        if (isTimerCanceled) {
                          widget.coinFlip.displayingText = currResult;
                          isTimerCanceled = false;
                        }
                      });
                    },
                    child: const Text(
                      'Flip!',
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
                      builder: (BuildContext context) => SettingAlertDialogCoin(
                            coinFlip: widget.coinFlip,
                          )),
                  child: kSettingIcon,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
