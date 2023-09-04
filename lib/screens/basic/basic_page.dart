import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../backend/calculator_brain.dart';
import '../../backend/constants.dart';
import '../../backend/result_provider.dart';
import '../../components/customButton.dart';

class BasicCalculatorPage extends StatefulWidget {
  const BasicCalculatorPage({Key? key}) : super(key: key);

  @override
  State<BasicCalculatorPage> createState() => _BasicCalculatorPageState();
}

class _BasicCalculatorPageState extends State<BasicCalculatorPage> {
  CalculatorBrain brain = CalculatorBrain();
  double aspectRatio = 1.5;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Consumer<ResultProvider>(
            builder: (context, result, child) => SizedBox(
              height: 200,
              child: AutoSizeText(
                result.result[0],
                style: kResultTextStyle,
                maxFontSize: 40,
                minFontSize: 30,
                stepGranularity: 10,
                maxLines: 3,
                overflowReplacement: Text(
                  'Expression is too long!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Consumer<ResultProvider>(
                builder: (context, result, child) => AutoSizeText(
                  result.result[1],
                  style: kOperationTextStyle,
                  maxFontSize: 30,
                  minFontSize: 15,
                  stepGranularity: 15,
                  maxLines: 2,
                  overflowReplacement: Text(
                    'Expression is too long!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: height >= 890 ? 7 : 9,
            child: Container(
              child: Material(
                color: Colors.grey.shade300,
                elevation: 15,
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: kIsWeb ? 1.3 : 1.5,
                  children: _createButtons(),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  List<Widget> _createButtons() {
    List<Widget> buttons = [];

    buttons.addAll([
      CalculatorButton(
        child: Text(
          'AC',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('AC')),
      ),
      CalculatorButton(
        child: Text(
          '+/-',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('+/-')),
      ),
      CalculatorButton(
        child: Text(
          '%',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('%')),
      ),
      CalculatorButton(
        child: Text(
          'C',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('C')),
        onLongPress: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('C')),
      ),
    ]);

    for (int row = 7; row <= 9; row++) {
      buttons.add(
        CalculatorButton(
          child: Text('$row'),
          onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('$row')),
        ),
      );
    }

    buttons.add(
      CalculatorButton(
        child: Text(
          '÷',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('÷')),
      ),
    );

    for (int row = 4; row <= 6; row++) {
      buttons.add(
        CalculatorButton(
          child: Text('$row'),
          onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('$row')),
        ),
      );
    }

    buttons.add(
      CalculatorButton(
        child: Text(
          'x',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('x')),
      ),
    );

    for (int row = 1; row <= 3; row++) {
      buttons.add(
        CalculatorButton(
          child: Text('$row'),
          onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('$row')),
        ),
      );
    }

    buttons.add(
      CalculatorButton(
        child: Text(
          '-',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('-')),
      ),
    );

    buttons.add(
      CalculatorButton(
        child: Text('.'),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('.')),
      ),
    );

    buttons.add(
      CalculatorButton(
        child: Text('0'),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('0')),
      ),
    );

    buttons.add(
      CalculatorButton(
        child: Text(
          '=',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('=')),
      ),
    );

    buttons.add(
      CalculatorButton(
        child: Text(
          '+',
          style: TextStyle(color: kOrangeColorText),
        ),
        onPressed: () => Provider.of<ResultProvider>(context, listen: false).updateResult(brain.buttonPressed('+')),
      ),
    );

    return buttons;
  }
}
