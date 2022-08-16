import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamiproject/home/quran/sura_details.dart';
import 'package:islamiproject/my-theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/hadeth/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'home/home_screen.dart';
import 'home/providers/settings-provider.dart';

void main() {
  runApp(ChangeNotifierProvider<SettingsProvider>(
    create: (buildContext){
      return SettingsProvider();},
//run app
      child: MyApp()));
}
class MyApp extends StatelessWidget {

  late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
     initSharedPref();
    return MaterialApp(
      theme: MyTheme.lighttheme,
      darkTheme: MyTheme.darktheme,
      themeMode: settingsProvider.currentTheme,

      routes: { HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen()},
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.currentLang),

    );
  }

  void initSharedPref() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('language') ?? 'en';
    settingsProvider.changeLanguage(lang);

    if (prefs.getString('theme') == 'dark') {
      settingsProvider.changeTheme(ThemeMode.dark);
    } else if (prefs.getString('theme') == 'light') {
      settingsProvider.changeTheme(ThemeMode.light);
    }
  }


}
