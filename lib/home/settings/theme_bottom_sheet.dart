import 'package:flutter/material.dart';
import 'package:islamiproject/home/providers/settings-provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
            onTap: (){

           settingsProvider.changeTheme(ThemeMode.light);
        }, child:settingsProvider.isDarkMode()?
    getSelectedItem( AppLocalizations.of(context)!.light):
    getUnSelectedItem( AppLocalizations.of(context)!.light)),

          SizedBox(
            height: 12,
          ),
          InkWell(onTap: (){
            settingsProvider.changeTheme(ThemeMode.dark);
          },
              child:settingsProvider.isDarkMode()?
                  getSelectedItem(AppLocalizations.of(context)!.dark):
    getUnSelectedItem( AppLocalizations.of(context)!.dark)),
      ]
    ),
    );


  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.headline5
                ?.copyWith(color: Theme.of(context).primaryColor)),
        Icon(Icons.check, color: Theme.of(context).primaryColor),
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.headline5),

      ],
    );
  }
}
