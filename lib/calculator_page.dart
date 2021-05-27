import 'package:flutter/material.dart';
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
  var result = ['0', ''];

  @override
  Widget build(BuildContext context) {
    CalculatorBrain brain = CalculatorBrain();

    return Scaffold(
      backgroundColor: Color(0xFFEDEBEC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 70,
                    ),
                    child: Text(
                      result[0],
                      style: kResultTextStyle,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    result[1],
                    style: kOperationTextStyle,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
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
                          var data = brain.buttonPressed("AC");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("+/-");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("%");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("÷");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("7");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("8");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("9");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("x");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("4");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("5");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("6");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("-");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("1");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("2");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("3");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("+");
                          result[0] = data[0];
                          result[1] = data[1];
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
                      buttonBoxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(40.0)),
                      colorText: kBlackColorText,
                      buttonText: "0",
                      buttonWidth: 2.9,
                      onPressed: () {
                        setState(() {
                          var data = brain.buttonPressed("0");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed(".");
                          result[0] = data[0];
                          result[1] = data[1];
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
                          var data = brain.buttonPressed("=");
                          result[0] = data[0];
                          result[1] = data[1];
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
