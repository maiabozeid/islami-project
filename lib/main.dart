import 'package:flutter/material.dart';
import 'package:islamiproject/home/quran/sura_details.dart';
import 'package:islamiproject/my-theme.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:MyTheme.lighttheme,

      routes:{ HomeScreen.routeName:(_)=> HomeScreen(),
        SuraDetailsScreen.routeName:(_)=> SuraDetailsScreen()},
      initialRoute:HomeScreen.routeName,


    );
    }
}
