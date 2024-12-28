import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableButton extends StatelessWidget {
  VoidCallback? onPressed;
  Widget? child;

  ReusableButton({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // 설정 버튼
      onPressed: onPressed,
      child: child,
      style: const ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(kCircleBackgroundColor),
      ),
    );
  }
}
