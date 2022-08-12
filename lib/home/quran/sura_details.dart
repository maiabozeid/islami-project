import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiproject/home/quran/verse_widget.dart';
import 'package:provider/provider.dart';

import '../providers/settings-provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    if (verses.isEmpty) readFile(args.index);
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
            title: Text(args.title,
              style: Theme.of(context).textTheme.headline5),
          ),
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 64),
                  decoration: BoxDecoration(
                      color:Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return VerseWidget(index, verses[index]);
                      },
                      itemCount: verses.length,
                      separatorBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 64),
                          color: Theme.of(context).primaryColor,
                          width: double.infinity,
                          height: 2,
                        );
                      }),
                ),
        ));
  }

  void readFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split("\n");
    print(lines);
    verses = lines;
    print(verses);
    setState(() {});
  }
}

class SuraDetailsArgs {
  int index;
  String title;

  SuraDetailsArgs(this.index, this.title);
}
