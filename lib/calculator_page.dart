import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:test_app/calculator_brain.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/roundButton.dart';

void main() => runApp(CalculatorPage());

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: CalculatorPageState(),
    );
  }
}

class CalculatorPageState extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPageState> {
  CalculatorBrain brain = CalculatorBrain();
  List<String> result = ['0', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEBEC),
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: AutoSizeText(
                result[0],
                style: kResultTextStyle,
                maxFontSize: 70,
                minFontSize: 20,
                stepGranularity: 10,
              ),
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                child: AutoSizeText(
                  result[1],
                  style: kOperationTextStyle,
                  maxFontSize: 30,
                  minFontSize: 10,
                  stepGranularity: 10,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "AC",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("AC");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "+/-",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("+/-");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "%",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("%");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kOrangeColorText,
                    buttonText: "C",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("C");
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "7",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("7");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "8",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("8");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "9",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("9");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kOrangeColorText,
                    buttonText: "÷",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("÷");
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "4",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("4");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "5",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("5");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "6",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("6");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kOrangeColorText,
                    buttonText: "x",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("x");
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "1",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("1");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "2",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("2");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: "3",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("3");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kOrangeColorText,
                    buttonText: "-",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("-");
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40.0)),
                    colorText: kBlackColorText,
                    buttonText: "0",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("0");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kBlackColorText,
                    buttonText: ".",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed(".");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kOrangeColorText,
                    buttonText: "=",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("=");
                      });
                    },
                  ),
                  RoundButton(
                    buttonBoxShape: NeumorphicBoxShape.circle(),
                    colorText: kOrangeColorText,
                    buttonText: "+",
                    buttonWidth: 8,
                    onPressed: () {
                      setState(() {
                        result = brain.buttonPressed("+");
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
