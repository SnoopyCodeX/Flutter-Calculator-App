import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  var output = ['0', ''];

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
    } else if (text == '%') {
    } else {
      print('Number: ' + text);
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

    print('Output: ' + output[0]);
    return output;
  }

  @protected
  clearDisplay() {
    output = ['0', ''];
    num1 = num2 = 0;
    operator = '';
    operatorPressed = false;
  }
}
