import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiproject/home/hadeth/hadeth-name-widget.dart';

class HadethTab extends StatefulWidget {

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if(hadethList.isEmpty)
    readHadethFile();
    return hadethList.isEmpty?
        Center(child: CircularProgressIndicator()):

    ListView.separated(itemBuilder: (_,index){

return HadethNameWidget(hadethList[index]);
    },itemCount: hadethList.length,
      separatorBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 64),
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          height: 2,
        );
      } ,
    );
  }

  void readHadethFile() async {
    String fileContent = await rootBundle.loadString('assets/files/ahadeth.txt');

    List<Hadeth> ahadethOfFile = [];
    List<String> allHadeth = fileContent.trim().split("#");
    for(int i = 0 ; i<allHadeth.length ; i++){
     List<String> hadethLines = allHadeth[i].trim().split('\n');
     String title = hadethLines[0];
     if(title.isEmpty)continue;
     hadethLines.removeAt(0);
     String content = hadethLines.join('\n');
     Hadeth h = Hadeth(title, content);
     ahadethOfFile.add(h);
    }
    hadethList = ahadethOfFile;
    setState((){});
  }
}
class Hadeth{
  String title;
  String content;

  Hadeth(this.title,this.content);
  }
