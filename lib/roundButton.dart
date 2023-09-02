import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RoundButton extends StatefulWidget {
  RoundButton({
    required this.buttonText,
    required this.colorText,
    required this.onPressed,
    required this.buttonBoxShape,
    required this.buttonWidth,
  });

  final String buttonText;
  final Color colorText;
  final Function onPressed;
  final NeumorphicBoxShape buttonBoxShape;
  final double buttonWidth;

  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: widget.onPressed as void Function(),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        depth: 6,
        shadowDarkColor: Colors.grey.shade500,
        lightSource: LightSource.topLeft,
        boxShape: widget.buttonBoxShape,
        color: Color(0xFFEDEBEC),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width / widget.buttonWidth,
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
              color: widget.colorText,
              fontSize: 23,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}
