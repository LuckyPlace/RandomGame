import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';
import 'package:random_game/random_picker/text_editor.dart';
import 'package:random_game/random_picker/two_lists.dart';
import 'package:random_game/reusable_button.dart';

List<int> numOfPeople = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
bool isSelected = false;
List<String?> nameList = List.filled(10, null);
List<String?> resultList = List.filled(10, null);

class SettingRandomPicker extends StatefulWidget {
  const SettingRandomPicker({super.key});

  @override
  State<SettingRandomPicker> createState() => _SettingRandomPickerState();
}

class _SettingRandomPickerState extends State<SettingRandomPicker> {
  int dropdownNumber = 3;

  List<Widget> generateTextEditors(int index) {
    List<Widget> rowList = [];
    if (isSelected) {
      for (int i = 0; i < index; i++) {
        rowList.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextEditor(
                index: i,
                isResult: false,
              ),
              TextEditor(
                index: i,
                isResult: true,
              ),
            ],
          ),
        );
      }
      rowList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReusableButton(
          onPressed: () {
            sendListsAndPop();
          },
          child: Text('설정 완료'),
        ),
      ));
    }
    return rowList;
  }

  int? setValue() {
    if (isSelected == false) {
      return null;
    } else {
      return dropdownNumber;
    }
  }

  // 두 리스트를 Navigator를 통해 이전 화면에 전달
  void sendListsAndPop() {
    TwoLists twoLists = TwoLists();
    twoLists.nameLists = nameList;
    twoLists.resultLists = resultList;
    Navigator.pop(context, twoLists);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              sendListsAndPop();
            },
            icon: kArrowLeftIcon),
        title: const Text('Setting'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: DropdownButton(
                        hint: const Text('사람 수를 선택해주세요.'),
                        dropdownColor: kCardBackgroundColor,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        value: setValue(),
                        underline: Container(
                          height: 2,
                          color: kCardBackgroundColor,
                        ),
                        items:
                            numOfPeople.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem(
                            child: Text(value.toString()),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownNumber = value!;
                            isSelected = true;
                            setValue();
                          });
                        }),
                  ),
                ),
              ] +
              generateTextEditors(dropdownNumber),
        ),
      ),
    );
  }
}
