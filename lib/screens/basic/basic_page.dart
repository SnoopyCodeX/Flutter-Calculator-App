import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../backend/calculator_brain.dart';
import '../../backend/constants.dart';
import '../../backend/result_provider.dart';
import '../../components/roundButton.dart';

class BasicCalculatorPage extends StatefulWidget {
  const BasicCalculatorPage({Key? key}) : super(key: key);

  @override
  State<BasicCalculatorPage> createState() => _BasicCalculatorPageState();
}

class _BasicCalculatorPageState extends State<BasicCalculatorPage> {
  CalculatorBrain brain = CalculatorBrain();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Consumer<ResultProvider>(
            builder: (context, result, child) => Expanded(
              child: AutoSizeText(
                result.result[0],
                style: kResultTextStyle,
                maxFontSize: 70,
                minFontSize: 20,
                stepGranularity: 10,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Consumer<ResultProvider>(
                builder: (context, result, child) => AutoSizeText(
                  result.result[1],
                  style: kOperationTextStyle,
                  maxFontSize: 30,
                  minFontSize: 10,
                  stepGranularity: 10,
                ),
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
                  colorText: kOrangeColorText,
                  buttonText: "AC",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("AC"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kOrangeColorText,
                  buttonText: "+/-",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("+/-"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kOrangeColorText,
                  buttonText: "%",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("%"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kOrangeColorText,
                  buttonText: "C",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("C"));
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
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("7"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kBlackColorText,
                  buttonText: "8",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("8"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kBlackColorText,
                  buttonText: "9",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("9"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kOrangeColorText,
                  buttonText: "÷",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("÷"));
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
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("4"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kBlackColorText,
                  buttonText: "5",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("5"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kBlackColorText,
                  buttonText: "6",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("6"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kOrangeColorText,
                  buttonText: "x",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("x"));
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
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("1"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kBlackColorText,
                  buttonText: "2",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("2"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kBlackColorText,
                  buttonText: "3",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("3"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kOrangeColorText,
                  buttonText: "-",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("-"));
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
                  buttonText: ".",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("."));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40.0)),
                  colorText: kBlackColorText,
                  buttonText: "0",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("0"));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kOrangeColorText,
                  buttonText: "=",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("="));
                  },
                ),
                RoundButton(
                  buttonBoxShape: NeumorphicBoxShape.circle(),
                  colorText: kOrangeColorText,
                  buttonText: "+",
                  buttonWidth: 8,
                  onPressed: () {
                    Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed("+"));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
