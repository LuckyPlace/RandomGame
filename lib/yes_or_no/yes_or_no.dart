import 'package:flutter/material.dart';
import 'package:random_game/constants.dart';

class YesOrNo extends StatelessWidget {
  const YesOrNo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNormalBackgroundColor,
      appBar: AppBar(
        backgroundColor: kNormalBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: kArrowLeftIcon,
        ),
        title: Text('Yes or No'),
      ),
    );
  }
}
