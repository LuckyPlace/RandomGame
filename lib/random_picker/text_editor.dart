import 'package:flutter/material.dart';
import 'package:random_game/random_picker/setting_random_picker.dart';
import '../constants.dart';

class TextEditor extends StatelessWidget {
  final int index;
  final bool isResult;

  TextEditor({required this.index, required this.isResult});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextField(
        cursorColor: Colors.white,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kCircleBackgroundColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: (index + 1).toString(),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
        onChanged: (String str) {
          if (isResult == false) {
            nameList[index] = str;
          } else {
            resultList[index] = str;
          }
        },
      ),
    );
  }
}
