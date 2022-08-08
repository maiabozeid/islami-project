import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiproject/home/hadeth/hadeth-tab.dart';
import 'package:islamiproject/home/quran/verse_widget.dart';
import 'package:provider/provider.dart';

import '../providers/settings-provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
          appBar: AppBar(
            centerTitle: true,
            title: Text(args.title),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 64),
                    decoration: BoxDecoration(
                        color:Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(24)),


                    child: Text(args.content,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline5,)
    ),
          ),
                        ),
    );

  }


}
