///Copyright 2021-2023

import 'package:flutter/material.dart';
import 'package:holding_gesture/holding_gesture.dart';

class CalculatorButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double fontSize;
  final Color fontColor;

  const CalculatorButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.fontSize = 25,
    this.fontColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: 'MontserratLight',
        fontSize: fontSize,
        color: fontColor,
      ),
      child: HoldDetector(
        onHold: () {
          if (onLongPress != null) onLongPress!();

          debugPrint("Holding!");
        },
        holdTimeout: Duration(milliseconds: 50),
        child: InkResponse(
          splashFactory: InkRipple.splashFactory,
          highlightColor: Colors.transparent,
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
