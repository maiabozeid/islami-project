import 'package:flutter/material.dart';
import 'package:islamiproject/home/quran/sura_details.dart';


// da lma bt3'ad 3la esm el sura byro7 ygeb el contents bta3tha
class SuraNameWidget extends StatelessWidget {
  String title;
  int index;

  SuraNameWidget(this.index, this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(index, title));
      },
      child: Container(

        padding: EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        child: Text(title, style: Theme.of(context).textTheme.headline5),
      ),
    );
  }
}
