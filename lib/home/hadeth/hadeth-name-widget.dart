import 'package:flutter/material.dart';
import 'package:islamiproject/home/hadeth/hadeth_details.dart';
import 'package:islamiproject/home/quran/sura_details.dart';

import 'hadeth-tab.dart';


// da lma bt3'ad 3la esm el sura byro7 ygeb el contents bta3tha
class HadethNameWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethNameWidget(this.hadeth);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    Navigator.pushNamed(context, HadethDetailsScreen.routeName,
    arguments: hadeth);
      },
      child: Container(

        padding: EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        child: Text(hadeth.title, style: Theme.of(context).textTheme.headline5),
      ),
    );
  }
}
