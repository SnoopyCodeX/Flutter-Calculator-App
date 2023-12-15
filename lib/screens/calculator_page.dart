///Copyright 2021-2023

import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/backend/result_provider.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../backend/constants.dart';
import 'advanced/advanced_page.dart';
import 'basic/basic_page.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPage createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> tabs = ['Basic', 'Advanced'];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEDEBEC),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context) => _buildAboutDialog());
              },
              icon: Icon(
                Icons.info_outlined,
                color: kBlackColorText,
              ),
            ),
          ],
          title: TabBar(
            indicatorColor: kOrangeColorText,
            labelColor: kBlackColorText,
            controller: tabController,
            tabs: <Widget>[
              Tab(text: tabs[0]),
              Tab(text: tabs[1]),
            ],
            onTap: (index) {
              if (index == currentIndex) return;

              Provider.of<ResultProvider>(context, listen: false).updateResult(['0', '']);
              setState(() => currentIndex = index);
            },
          ),
        ),
        body: currentIndex == 0 ? const BasicCalculatorPage() : const AdvancedCalculatorPage(),
      ),
    );
  }

  Widget _buildAboutDialog() {
    return GiffyDialog.lottie(
      LottieBuilder.asset('assets/lottie/lottie-1.json'),
      title: Text('About This App'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(
        'This is a simple calculator made with flutter. I made this 2 years ago as my first practice flutter application, and then decided to submit this as my entry for Studev\'s Quest #8 Calculator Challenge.'
        ' I had to refactor and add some more features to this app because this only had basic functions when I first created this.\n\n'
        'Collabed with: Leslie G. Martinez\n'
        '© SnoopyCodeX 2021-${DateTime.now().year}',
      ),
      actions: [
        TextButton(
          onPressed: () async {
            String githubRepoURL = "https://github.com/SnoopyCodeX/Flutter-Calculator-App";
            if (await canLaunchUrl(Uri.parse(githubRepoURL))) {
              await launchUrl(Uri.parse(githubRepoURL));
            }

            Navigator.of(context).pop();
          },
          child: Text('Open Github Repo'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Okay'),
        ),
      ],
    );
  }
}
