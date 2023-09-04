import 'package:flutter/material.dart';

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
      child: InkResponse(
        splashFactory: InkRipple.splashFactory,
        highlightColor: Colors.transparent,
        onTap: onPressed,
        onTapDown: (details) => onLongPress,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
