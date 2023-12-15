///Copyright 2021-2023

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:provider/provider.dart';

import 'backend/result_provider.dart';
import 'backend/valuex_provider.dart';
import 'screens/calculator_page.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    double height = MediaQuery.of(context).size.height;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResultProvider()),
        ChangeNotifierProvider(create: (_) => ValueXProvider()),
      ],
      child: FlutterWebFrame(
        enabled: kIsWeb,
        maximumSize: Size(496, height),
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: false),
          home: CalculatorPage(),
        ),
      ),
    );
  }
}
