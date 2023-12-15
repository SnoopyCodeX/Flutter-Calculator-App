///Copyright 2021-2023

import 'package:flutter/material.dart';

import 'dart_stack.dart';

class CalculatorBrain {
  List<String> _output = ['0', ''];
  bool _operatorPressed = false;

  dynamic buttonPressed(String text) {
    String topText = _output[0];
    String bottomText = _output[1];

    switch (text) {
      case 'AC':
        _clearDisplay();
        break;

      case 'C':
        _clearPreviousInput();
        break;

      case '.':
        if (!_operatorPressed) {
          if (topText.contains('.')) return _output;

          _output[0] += '.';
        } else {
          if (bottomText.contains('.')) return _output;

          _output[1] += '.';
        }
        break;

      case '+/-':
        if (bottomText.contains('=') && bottomText.isNotEmpty) return _output;

        if (topText == '0' && !_operatorPressed || bottomText == '0' && _operatorPressed) return _output;

        if (!_operatorPressed) {
          if (topText.startsWith('-'))
            _output[0] = topText.substring(1);
          else
            _output[0] = '-' + topText;
        } else {
          if (bottomText.startsWith('-'))
            _output[1] = bottomText.substring(1);
          else
            _output[1] = '-' + bottomText;
        }
        break;

      case '+':
      case '-':
      case 'x':
      case '÷':
        if (bottomText.contains('=')) {
          _output[0] = "${bottomText.substring(2)} $text";
          _output[1] = "";

          bottomText = _output[1];
          topText = _output[0];
        }

        if (bottomText.isNotEmpty || !_isOperator(topText[topText.length - 1])) {
          _output[0] += bottomText.isNotEmpty ? " $bottomText" : "";
          _output[1] = "";

          topText = _output[0];
          bottomText = _output[1];

          _operatorPressed = false;
        }

        String lastChar = topText[topText.length - 1];
        _operatorPressed = true;

        if (_isOperator(lastChar)) {
          _output[0] = topText.substring(0, topText.length - 1);
          _output[0] += text;
        } else {
          if (lastChar == '.') _output[0] += '0';
          _output[0] += " $text";
        }
        break;

      case '%':
        if (topText == '0') return _output;

        if (_operatorPressed) _clearPreviousInput();

        bool hasExpression = false;
        if (bottomText.isNotEmpty) {
          if (bottomText.contains('='))
            _output[0] = bottomText.substring(2);
          else {
            _output[0] += " $bottomText";
            hasExpression = true;
          }
        }

        if (hasExpression) {
          String answer = _evaluateExpression(_output[0]);

          if (answer.contains("Cannot divide by zero!")) {
            _output[1] = answer;
            return _output;
          }

          _output[0] += ' = $answer%';
          _output[1] = "= ${(answer.contains(".") ? (double.parse(answer) / 100) : (int.parse(answer) / 100))}"; // Display final result on bottom text
        } else {
          _output[1] = "= ${_output[0].contains(".") ? (double.parse(_output[0]) / 100) : (int.parse(_output[0]) / 100)}";
          _output[0] += '%';
        }
        break;

      case '=':
        if (bottomText.isEmpty && topText.isNotEmpty && topText != '0') {
          RegExp lastCharExp = RegExp(r'[\+|\-|x|÷]$');
          if (!_isValidExpression(topText) || lastCharExp.hasMatch(topText))
            _output[1] = "= Invalid expression!";
          else {
            _output[1] = "= ${_evaluateExpression(topText)}";
          }

          return _output;
        }

        if (bottomText.isNotEmpty && !bottomText.contains('=')) {
          _output[0] += " $bottomText";

          String answer = _evaluateExpression(_output[0]);
          _output[1] = "= $answer"; // Display final result on bottom text
        }
        break;

      default:
        if (!_operatorPressed) {
          if (topText.length == 1 && topText == '0')
            _output[0] = text;
          else
            _output[0] += text;
        } else {
          if (bottomText.length == 1 && bottomText == '0')
            _output[1] = text;
          else
            _output[1] += text;
        }
    }

    return _output;
  }

  @protected
  _clearDisplay() {
    _output = ['0', ''];
    _operatorPressed = false;
  }

  @protected
  _clearPreviousInput() {
    String topText = _output[0];
    String bottomText = _output[1];

    // Check if bottom text is not empty
    // If so,  we want to first clear the bottom text
    // until it's empty before proceeding to the top text.
    if (bottomText.isNotEmpty) {
      // Clear all bottom text if it contains an equal sign
      if (bottomText.contains('='))
        _output[1] = '';
      else
        // Remove last char from the bottom text
        _output[1] = bottomText.length > 1 ? bottomText.substring(0, bottomText.length - 1) : '';
      return;
    }

    if (topText.isNotEmpty && topText != '0') {
      String lastLastChar = topText.length > 1 ? topText[topText.length - 2] : '';
      String lastChar = topText[topText.length - 1];

      // If last character is an operator
      if (_isOperator(lastChar)) {
        _operatorPressed = false;
      }

      // Remove last char from the top text
      _output[0] = topText.length > 1 ? topText.substring(0, topText.length - (_isOperator(lastChar) || lastLastChar == '-' || lastLastChar == ' ' ? 2 : 1)) : '';
      _output[0] = _output[0].isEmpty ? '0' : _output[0];
    }
  }

  @protected
  bool _isOperator(String char) {
    return (_getOperatorPrecedence(char) != -1);
  }

  @protected
  int _getOperatorPrecedence(String operator) {
    switch (operator) {
      case '+':
      case '-':
        return 0;

      case 'x':
      case '÷':
        return 1;

      case '^':
        return 2;
    }

    return -1;
  }

  @protected
  dynamic _performOperation(dynamic operand1, dynamic operand2, String operator) {
    dynamic result = 0.00;

    switch (operator) {
      case '+':
        result = operand1 + operand2;
        break;

      case '-':
        result = operand1 - operand2;
        break;

      case 'x':
        result = operand1 * operand2;
        break;

      case '÷':
        result = (operand2 == 0) ? "Cannot divide by zero!" : operand1 / operand2;
        break;

      case '%':
        result = operand1 / 100;
        break;
    }

    return result;
  }

  @protected
  bool _isValidExpression(String expression) => !(_infixToPostfix(expression).toLowerCase().contains("invalid"));

  @protected
  String _evaluateExpression(String expression) {
    DartStack<dynamic> stack = DartStack<dynamic>();
    RegExp isDigitRegEx = RegExp(r'\-?[0-9]+\.?[0-9]*');
    String postfix = _infixToPostfix(expression);
    String result = "";

    for (String exp in postfix.split(" ")) {
      if (isDigitRegEx.hasMatch(exp)) {
        stack.push(double.parse(exp));
      } else {
        double operand2 = stack.pop();

        if (exp == '!') {
          String operator = exp;
          stack.push(_performOperation(operand2, 0, operator));

          continue;
        }

        double operand1 = stack.pop();
        String operator = exp;

        stack.push(_performOperation(operand1, operand2, operator));
      }
    }

    debugPrint("Postfix: $postfix");
    result = "${stack.pop()}";
    return result;
  }

  @protected
  String _infixToPostfix(String infixExpression) {
    DartStack<String> stack = DartStack<String>();
    String postfixExpression = "";

    for (int index = 0; index < infixExpression.length; index++) {
      String exp = infixExpression[index];

      RegExp isDigitRegEx = RegExp(r'[0-9]');

      // Check for valid negative numbers
      if (exp == '-') {
        if (index + 1 >= infixExpression.length) return "Invalid expression!";

        if (isDigitRegEx.hasMatch(infixExpression[index + 1]) || infixExpression[index + 1] == '.') {
          postfixExpression += exp;
          continue;
        }
      }

      // Check for decimal numbers
      if (exp == '.') {
        postfixExpression += exp;
      } else if (isDigitRegEx.hasMatch(exp) || exp == ' ') // Check for valid positive numbers and whitespace
        postfixExpression += exp;
      else if (exp == '(') // Check for open parenthesis
        stack.push(exp);
      // Check for closing parethesis
      else if (exp == ')') {
        while (stack.isNotEmpty && stack.peek() != '(') {
          postfixExpression += stack.pop();
        }

        if (stack.isNotEmpty) stack.pop();
      } else {
        // Check for operators and their precedence
        while (stack.isNotEmpty && _getOperatorPrecedence(exp) <= _getOperatorPrecedence(stack.peek())) {
          postfixExpression += stack.pop();
        }

        stack.push(exp);
      }
    }

    while (stack.isNotEmpty) {
      if (stack.peek() == '(') return "Invalid expression!";
      postfixExpression += stack.pop();
    }

    if (postfixExpression.startsWith(' ')) postfixExpression = postfixExpression.substring(1);
    postfixExpression = postfixExpression.replaceAll(RegExp("\\s\\s+"), " ");
    postfixExpression = _toValidPostfix(postfixExpression);

    debugPrint("@_infixToPostfix--result: $postfixExpression");

    return postfixExpression;
  }

  @protected
  String _toValidPostfix(String postfix) {
    String dirtyPostfix = postfix;
    String validPostfix = "";

    for (int index = 0; index < dirtyPostfix.length; index++) {
      RegExp isDigitRegEx = RegExp(r'[0-9]');
      String exp = dirtyPostfix[index];

      if (exp == "-") {
        if ((index + 1) < dirtyPostfix.length) {
          if (isDigitRegEx.hasMatch(dirtyPostfix[index + 1]) || dirtyPostfix[index + 1] == '.') {
            validPostfix += exp;

            continue;
          }
        }
      }

      if (exp == '.') {
        validPostfix += exp;
      } else if (isDigitRegEx.hasMatch(exp) || exp == ' ')
        validPostfix += exp;
      else if (_isOperator(exp)) {
        if ((index - 1) < 0) return "Invalid postfix expression! @[$index - 1]";

        if (dirtyPostfix[index - 1] == ' ')
          validPostfix += exp;
        else
          validPostfix += " $exp";
      }
    }

    return validPostfix;
  }
}
