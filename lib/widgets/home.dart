import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/markets/markets.dart';
import 'package:sma/widgets/news/news.dart';
import 'package:sma/widgets/portfolio/portfolio.dart';
import 'package:sma/widgets/search/search.dart';

class StockMarketAppHome extends StatefulWidget {
  @override
  _StockMarketAppHomeState createState() => _StockMarketAppHomeState();
}

class _StockMarketAppHomeState extends State<StockMarketAppHome> {

  int _selectedIndex = 0;

  final List<Widget> tabs = [
    PortfolioSection(),
    MarketsSection(),
    NewsSection(),
    SearchSection()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: tabs.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: Colors.white60,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Colors.white30,
            selectedIndex: _selectedIndex,
            tabs: _bottomNavigationBarItemItems(),
            onTabChange: _onItemTapped
          ),
        ),
      )
    );
  }

  List<GButton> _bottomNavigationBarItemItems() {
    return [
      GButton(
        icon: FontAwesomeIcons.shapes,
        text: 'Home',
      ),
      GButton(
        icon: FontAwesomeIcons.suitcase,
        text: 'Markets',
      ),
      GButton(
        icon: FontAwesomeIcons.globeAmericas,
        text: 'News',
      ),
      GButton(
        icon: FontAwesomeIcons.search,
        text: 'Search',
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}