import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFFEDEBEC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
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
            setState(() => currentIndex = index);
          },
        ),
      ),
      body: currentIndex == 0 ? const BasicCalculatorPage() : const AdvancedCalculatorPage(),
    );
  }
}
