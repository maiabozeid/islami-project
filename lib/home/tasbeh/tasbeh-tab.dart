import 'package:flutter/material.dart';
import 'dart:math' as maths;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {


  int counter = 0;
  List<String> tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لاحول و لاقوة الا بالله'
  ];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/head_of_sebha.png'),
              InkWell(
                onTap: onTasbehTab,
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * .05),
                  child: Transform.rotate(
                    angle: maths.pi / 180 * angle,
                    child: Image.asset('assets/images/body_of_sebha.png'),
                  ),
                ),
              ),
            ],
          ),

          Text(
            AppLocalizations.of(context)!.noOfTasbeh,

            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,

            ),),
          SizedBox(
            height: 3,
          ),
      Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Color(0xffB7935F),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffB7935F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${tasbeh[index]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

        ],
      ),
    );
  }

  void onTasbehTab() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == tasbeh.length) {
      index = 0;
    }
    angle += 100 / 33;
    setState(() {});
  }
}
