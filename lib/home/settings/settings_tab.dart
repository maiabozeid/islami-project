import 'package:flutter/material.dart';
import 'package:islamiproject/home/providers/settings-provider.dart';
import 'package:islamiproject/home/settings/theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return SizedBox(
      child: Container(
        padding: EdgeInsets.all(12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.bodyText1),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.lang,
                      style: Theme.of(context).textTheme.headline5,
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Text(AppLocalizations.of(context)!.theme,
                  style: Theme.of(context).textTheme.bodyText1),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Text(
                      settingsProvider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.headline5,
                    )),
              ),
            ],
          ),
        ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }
}
