import 'package:flutter/material.dart';
import 'package:islamiproject/home/hadeth/hadeth-tab.dart';

import 'package:islamiproject/home/quran/quran-tab.dart';
import 'package:islamiproject/home/radio/radio-tab.dart';
import 'package:islamiproject/home/tasbeh/tasbeh-tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg3.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Islami',
            style:TextStyle(),
          ),
        ),

        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/quran.png'),
                  ),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/hadeth.png'),
                  ),
                  label: 'Hadeth'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                  ),
                  label: 'Tasebh'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/radio.png'),
                  ),
                  label: 'Radio'),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab()];
}
