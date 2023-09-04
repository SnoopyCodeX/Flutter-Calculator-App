import 'package:flutter/cupertino.dart';
import 'dart_stack.dart';

class CalculatorBrain {
  List<String> output = ['0', ''];
  bool operatorPressed = false;

  dynamic buttonPressed(String text) {
    String topText = output[0];
    String bottomText = output[1];

    switch (text) {
      case 'AC':
        clearDisplay();
        break;

      case 'C':
        clearPreviousInput();
        break;

      case '.':
        if (!operatorPressed) {
          if (topText.contains('.')) return output;

          output[0] += '.';
        } else {
          if (bottomText.contains('.')) return output;

          output[1] += '.';
        }
        break;

      case '+/-':
        if (topText == '0' && !operatorPressed || bottomText == '0' && operatorPressed) return output;

        if (!operatorPressed) {
          if (topText.startsWith('-'))
            output[0] = topText.substring(1);
          else
            output[0] = '-' + topText;
        } else {
          if (bottomText.startsWith('-'))
            output[1] = bottomText.substring(1);
          else
            output[1] = '-' + bottomText;
        }
        break;

      case '+':
      case '-':
      case 'x':
      case '÷':
        if (bottomText.isNotEmpty || !isOperator(topText[topText.length - 1])) {
          output[0] += bottomText.isNotEmpty ? " $bottomText" : "";
          output[1] = "";

          topText = output[0];
          bottomText = output[1];

          operatorPressed = false;
        }

        String lastChar = topText[topText.length - 1];
        operatorPressed = true;

        if (isOperator(lastChar)) {
          output[0] = topText.substring(0, topText.length - 1);
          output[0] += text;
        } else {
          if (lastChar == '.') output[0] += '0';
          output[0] += " $text";
        }
        break;

      case '%':
        if (topText == '0') return output;

        if (operatorPressed) clearPreviousInput();

        bool hasExpression = false;
        if (bottomText.isNotEmpty) {
          if (bottomText.contains('='))
            output[0] = bottomText.substring(2);
          else {
            output[0] += " $bottomText";
            hasExpression = true;
          }
        }

        if (hasExpression) {
          String answer = evaluateExpression(output[0]);

          if (answer.contains("Cannot divide by zero!")) {
            output[1] = answer;
            return output;
          }

          output[0] += ' = $answer%';
          output[1] = "= ${(answer.contains(".") ? (double.parse(answer) / 100) : (int.parse(answer) / 100))}"; // Display final result on bottom text
        } else {
          output[1] = "= ${output[0].contains(".") ? (double.parse(output[0]) / 100) : (int.parse(output[0]) / 100)}";
          output[0] += '%';
        }
        break;

      case '=':
        if (bottomText.isNotEmpty && !bottomText.contains('=')) {
          output[0] += " $bottomText";

          String answer = evaluateExpression(output[0]);
          output[1] = "= $answer"; // Display final result on bottom text
        }
        break;

      default:
        if (!operatorPressed) {
          if (topText.length == 1 && topText == '0')
            output[0] = text;
          else
            output[0] += text;
        } else {
          if (bottomText.length == 1 && bottomText == '0')
            output[1] = text;
          else
            output[1] += text;
        }
    }

    return output;
  }

  @protected
  clearDisplay() {
    output = ['0', ''];
    operatorPressed = false;
  }

  @protected
  clearPreviousInput() {
    String topText = output[0];
    String bottomText = output[1];

    // Check if bottom text is not empty
    // If so,  we want to first clear the bottom text
    // until it's empty before proceeding to the top text.
    if (bottomText.isNotEmpty) {
      // Remove last char from the bottom text
      output[1] = bottomText.length > 1 ? bottomText.substring(0, bottomText.length - 1) : '';
      return;
    }

    if (topText.isNotEmpty && topText != '0') {
      String lastLastChar = topText.length > 1 ? topText[topText.length - 2] : '';
      String lastChar = topText[topText.length - 1];

      // If last character is an operator
      if (isOperator(lastChar)) {
        operatorPressed = false;
      }

      // Remove last char from the top text
      output[0] = topText.length > 1 ? topText.substring(0, topText.length - (isOperator(lastChar) || lastLastChar == '-' || lastLastChar == ' ' ? 2 : 1)) : '';
      output[0] = output[0].isEmpty ? '0' : output[0];
    }
  }

  @protected
  bool isOperator(String char) {
    return (getOperatorPrecedence(char) != -1);
  }

  @protected
  int getOperatorPrecedence(String operator) {
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
  dynamic performOperation(dynamic operand1, dynamic operand2, String operator) {
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
  String evaluateExpression(String expression) {
    DartStack<dynamic> stack = DartStack<dynamic>();
    RegExp isDigitRegEx = RegExp(r'\-?[0-9]+\.?[0-9]*');
    String postfix = infixToPostfix(expression);
    String result = "";

    for (String exp in postfix.split(" ")) {
      if (isDigitRegEx.hasMatch(exp)) {
        stack.push(double.parse(exp));
      } else {
        double operand2 = stack.pop();

        if (exp == '!') {
          String operator = exp;
          stack.push(performOperation(operand2, 0, operator));

          continue;
        }

        double operand1 = stack.pop();
        String operator = exp;

        stack.push(performOperation(operand1, operand2, operator));
      }
    }

    debugPrint("Postfix: $postfix");
    result = "${stack.pop()}";
    return result;
  }

  @protected
  String infixToPostfix(String infixExpression) {
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
        while (stack.isNotEmpty && getOperatorPrecedence(exp) <= getOperatorPrecedence(stack.peek())) {
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
    postfixExpression = toValidPostfix(postfixExpression);

    return postfixExpression;
  }

  @protected
  String toValidPostfix(String postfix) {
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
      else if (isOperator(exp)) {
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
