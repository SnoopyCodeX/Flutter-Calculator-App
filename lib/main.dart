import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator_app/backend/valuex_provider.dart';
import 'package:provider/provider.dart';

import 'backend/result_provider.dart';
import 'screens/calculator_page.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResultProvider()),
        ChangeNotifierProvider(create: (_) => ValueXProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: CalculatorPage(),
      ),
    );
  }
}
