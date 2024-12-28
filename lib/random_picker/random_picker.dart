import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';
import 'package:random_game/random_picker/result_page.dart';
import 'package:random_game/random_picker/setting_random_picker.dart';
import 'package:random_game/random_picker/two_lists.dart';
import 'package:random_game/reusable_button.dart';
import 'package:vibration/vibration.dart';
import '../reusable_container.dart';

List<String?> player = [];
List<String?> task = [];
List<int> rndSet = [];
Map<String?, String?> result = {};

class RandomPicker extends StatefulWidget {
  const RandomPicker({super.key});

  @override
  State<RandomPicker> createState() => _RandomPickerState();
}

class _RandomPickerState extends State<RandomPicker> {
  String? dropdownValue; // DropdownButton의 현재 값
  TwoLists twoLists = TwoLists(); // 리스트 두개를 Navigator로 받아오기 위한 class
  bool isRandomized = false; // 처음 랜덤화를 시킬 때 사용하는 flag
  bool isTimerCancelled = false; // Timer.periodic이 끝났는지 확인하기 위한 flag
  String displayingText = '';

  // playerList와 taskList에 복사하고 null을 없애는 함수
  void setPlayerLists() {
    player = List.from(twoLists.nameLists);
    dropdownValue = player.first;
    player.removeWhere((element) => element == null);
    task = List.from(twoLists.resultLists);
    task.removeWhere((element) => element == null);
  }

  // 랜덤 숫자를 저장
  void generateNumbers(int length) {
    while (true) {
      // 랜덤으로 번호를 생성해준다.
      var rnd = Random().nextInt(length);

      // 만약 리스트에 생성된 번호가 없다면
      if (!rndSet.contains(rnd)) {
        // 리스트에 추가해준다.
        rndSet.add(rnd);
      }

      // 리스트의 길이가 length면 while문을 종료한다.
      if (rndSet.length == length) break;
    }
  }

  // result map에 뽑은 결과를 저장하는 함수
  void randomPick() {
    var curLength = player.length;
    generateNumbers(curLength);
    for (int i = 0; i < curLength; i++) {
      result[player[i]] = task[rndSet[i]];
    }
  }

  // list들 초기화하는 함수
  void initializingLists() {
    isRandomized = false;
    player.clear();
    result.clear();
    rndSet.clear();
    task.clear();
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
          'Random Picker',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    result: result,
                  );
                }));
              },
              icon: kResultIcon)
        ],
        backgroundColor: kNormalBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                hint: const Text('설정 키를 눌러 인원을 설정해 주세요.'),
                dropdownColor: kCardBackgroundColor,
                style: const TextStyle(color: Colors.white),
                underline: Container(
                  height: 2,
                  color: kCardBackgroundColor,
                ),
                value: dropdownValue,
                items: player.map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    child: Text(value!),
                    value: value,
                  );
                }).toList(),
                onChanged: (String? index) {
                  setState(() {
                    dropdownValue = index!; // !은 null이 아님을 확신 할 경우 사용
                    displayingText = '';
                  });
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ReusableContainerLarge(
                  child: Center(
                    child: Text(
                      displayingText,
                      style: kMainContainerTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ReusableButton(
                      onPressed: () {
                        if (player.isNotEmpty) {
                          if (!isRandomized) {
                            randomPick();
                            isRandomized = true;
                          }
                          var counter = 25;
                          var index = 0;
                          Timer.periodic(Duration(milliseconds: 100), (timer) {
                            setState(() {
                              displayingText = task[index]!;
                            });
                            Vibration.vibrate(duration: 10);
                            index++;
                            if (index == player.length) {
                              index = 0;
                            }
                            counter--;
                            if (counter == 0) {
                              timer.cancel();
                              isTimerCancelled = true;
                              print('first timer done');
                            }
                          });
                          Timer.periodic(Duration(milliseconds: 100), (timer) {
                            if (isTimerCancelled) {
                              setState(() {
                                displayingText = result[dropdownValue]!;
                              });
                              Vibration.vibrate(duration: 100);
                              timer.cancel();
                            }
                            isTimerCancelled = false;
                          });
                        }
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
                    onPressed: () {
                      initializingLists(); // 설정으로 보내기 전에 초기화
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SettingRandomPicker();
                      })).then((value) {
                        if (value != null) {
                          // twoLists의 형태로 두개의 리스트를 설정으로부터 받아옴
                          setState(() {
                            twoLists = value;
                            setPlayerLists();
                          });
                        }
                      });
                    },
                    child: kSettingIcon,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
