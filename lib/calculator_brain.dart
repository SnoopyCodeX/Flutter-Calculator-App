import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  List<String> output = ['0', ''];

  dynamic num1 = 0;
  dynamic num2 = 0;

  String operator = '';
  bool operatorPressed = false;

  dynamic buttonPressed(String text) {
    if (text == 'AC')
      clearDisplay();
    else if (text == '.') {
      if (!operatorPressed) {
        if (output[0].contains('.')) return output;

        output[0] += '.';
      }
    } else if (text == "+/-") {
      if (output[0] == '0' && !operatorPressed ||
          output[1] == '0' && operatorPressed) return output;

      if (!operatorPressed) {
        if (output[0].startsWith('-'))
          output[0] = output[0].substring(1);
        else
          output[0] = '-' + output[0];
      } else {
        if (output[1].startsWith('-'))
          output[1] = output[1].substring(1);
        else
          output[1] = '-' + output[1];
      }
    } else if (text == '+' || text == '-' || text == 'x' || text == '÷') {
      operator = text;
      operatorPressed = true;

      num1 = (output[0].contains('.'))
          ? double.parse(output[0])
          : int.parse(output[0]);

      output[0] += " $operator";
    } else if (text == '=') {
      if (output[1] != '') {
        num1 = (output[0].substring(0, output[0].length - 2).contains('.')
            ? double.parse(output[0].substring(0, output[0].length - 2))
            : int.parse(output[0].substring(0, output[0].length - 2)));

        num2 = (output[1].contains('.'))
            ? double.parse(output[1])
            : int.parse(output[1]);

        output[0] = "$num1 $operator $num2";
        output[1] = performOperation(num1, num2);
        output[1] = '= ' +
            (output[1].substring(1).trim().contains('.')
                ? double.parse(output[1]).toStringAsFixed(2)
                : int.parse(output[1]).toString());
      }
    } else if (text == '%') {
      if (output[0] == '0') return output;

      operator = text;
      num1 = (output[0].contains('.')
          ? double.parse(output[0])
          : int.parse(output[0]));
      num2 = 0;

      output[0] += '%';
      output[1] = performOperation(num1, num2);
      output[1] = '= ' +
          (output[1].substring(1).trim().contains('.')
              ? double.parse(output[1]).toStringAsFixed(2)
              : int.parse(output[1]).toString());
    } else {
      // Numbers being pressed
      if (!operatorPressed) {
        if (output[0].length == 1 && output[0] == '0')
          output[0] = text;
        else
          output[0] += text;

        num1 = (output[0].contains('.'))
            ? double.parse(output[0])
            : int.parse(output[0]);
      } else {
        if (output[1].length == 1 && output[1] == '0')
          output[1] = text;
        else
          output[1] += text;

        num2 = (output[1].contains('.'))
            ? double.parse(output[1])
            : int.parse(output[1]);
      }
    }

    return output;
  }

  @protected
  clearDisplay() {
    output = ['0', ''];
    num1 = num2 = 0;
    operator = '';
    operatorPressed = false;
  }

  @protected
  String performOperation(dynamic num1, dynamic num2) {
    String result = '';

    switch (operator) {
      case '+':
        result = "${num1 + num2}";
        break;

      case '-':
        result = "${num1 - num2}";
        break;

      case 'x':
        result = "${num1 * num2}";
        break;

      case '÷':
        result = (num2 == 0) ? "Cannot divide by zero!" : "${num1 / num2}";
        break;

      case '%':
        result = "${num1 / 100}";
        break;
    }

    return result;
  }
}
