import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/app_colors.dart';
import 'package:islamic/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelected(AppLocalizations.of(context)!.english)
                  : getUnSelected(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelected(AppLocalizations.of(context)!.arabic)
                  : getUnSelected(AppLocalizations.of(context)!.arabic)),
        ],
      ),
    );
  }

  Widget getSelected(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.bottom_nav_color),
        ),
        Icon(
          Icons.check,
          color: AppColors.bottom_nav_color,
          size: 35,
        ),
      ],
    );
  }

  Widget getUnSelected(String text) {
    return Text(text, style: Theme.of(context).textTheme.bodySmall);
  }
}
