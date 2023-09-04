import 'package:flutter_calculator_app/backend/constants.dart';
import 'package:flutter_calculator_app/backend/valuex_provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class AdvancedCalculatorPage extends StatefulWidget {
  const AdvancedCalculatorPage({Key? key}) : super(key: key);

  @override
  State<AdvancedCalculatorPage> createState() => _AdvancedCalculatorPageState();
}

class _AdvancedCalculatorPageState extends State<AdvancedCalculatorPage> {
  late Expression _expression = Parser().parse("(x^2)/2+1");
  late MathFieldEditingController _mathFieldEditingController = MathFieldEditingController()..updateValue(_expression);
  late MathFieldEditingController _valueController = MathFieldEditingController()..updateValue(Parser().parse("1"));
  double _result = 0;
  double _value = 1;

  @override
  void initState() {
    super.initState();

    calculateResult();
  }

  @override
  void dispose() {
    _valueController.dispose();
    _mathFieldEditingController.dispose();

    super.dispose();
  }

  void calculateResult() {
    try {
      setState(() {
        _result = _expression.evaluate(EvaluationType.REAL, ContextModel()..bindVariableName('x', Number(_value)));
      });
    } catch (e) {
      debugPrint("Evaluation failed! $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MathField(
            controller: _mathFieldEditingController,
            keyboardType: MathKeyboardType.expression,
            opensKeyboard: true,
            variables: ['x'],
            decoration: InputDecoration(
              filled: true,
              focusColor: kBlackColorText,
              labelText: "Input expression",
              labelStyle: TextStyle(color: kBlackColorText),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kBlackColorText),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kBlackColorText),
              ),
            ),
            onChanged: (expression) {
              Provider.of<ValueXProvider>(context, listen: false)..updateX(expression.contains('x'));
              calculateResult();
            },
            onSubmitted: (expression) {
              calculateResult();
            },
            autofocus: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Consumer<ValueXProvider>(
                builder: (context, model, child) => Visibility(
                  visible: model.hasValueX,
                  child: SizedBox(
                    width: 125,
                    child: MathField(
                      controller: _valueController,
                      keyboardType: MathKeyboardType.numberOnly,
                      onChanged: (value) {
                        try {
                          _value = TeXParser(value).parse().evaluate(EvaluationType.REAL, ContextModel());
                          calculateResult();
                        } catch (_) {}
                      },
                      decoration: InputDecoration(
                        labelText: 'Value for x',
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.arrow_right_alt_outlined),
              ),
              Text("Result: $_result"),
            ],
          ),
        )
      ],
    );
  }
}
