import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableContainerLarge extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final Color? borderColor;

  ReusableContainerLarge({this.child, this.backgroundColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: backgroundColor == null ? kCardBackgroundColor : backgroundColor,
        border: Border.all(
            color: borderColor == null ? Colors.white70 : borderColor!,
            width: 1),
      ),
      child: child,
    );
  }
}

class ReusableContainerSmall extends StatelessWidget {
  final Widget? child;

  ReusableContainerSmall({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: kCardBackgroundColor,
        border: Border.all(color: Colors.white70, width: 1),
      ),
      child: child,
    );
  }
}
