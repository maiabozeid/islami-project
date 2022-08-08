import 'package:flutter/material.dart';
import 'package:islamiproject/home/hadeth/hadeth-tab.dart';
import 'package:islamiproject/home/providers/settings-provider.dart';
import 'package:islamiproject/home/quran/quran-tab.dart';
import 'package:islamiproject/home/radio/radio-tab.dart';
import 'package:islamiproject/home/settings/settings_tab.dart';
import 'package:islamiproject/home/tasbeh/tasbeh-tab.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
         provider.getMainBackGround(),
        ),
        fit: BoxFit.fill,
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(

      iconTheme: IconThemeData(
        color: Colors.black
      ),
        centerTitle: true,

    title: Text(AppLocalizations.of(context)!.app_title,
        style: Theme.of(context).textTheme.headline4),

    ),




    bottomNavigationBar: 
    BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        selectedIndex = index;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            icon: ImageIcon(
              AssetImage('assets/images/quran.png'),
            ),
                  label: AppLocalizations.of(context)!.quran_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  icon: ImageIcon(
                    AssetImage('assets/images/hadeth.png'),
                  ),
                  label: AppLocalizations.of(context)!.hadeth_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  icon: ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                  ),
                  label: AppLocalizations.of(context)!.tasbeh_title),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  icon: ImageIcon(
                    AssetImage('assets/images/radio.png'),
                  ),
                  label: AppLocalizations.of(context)!.radio_title),

              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings_title),
              ]


          ),
          body: tabs[selectedIndex],
        ),
      );
    }

    List<Widget> tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab(), SettingsTab()];
  }

