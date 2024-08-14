import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/app_colors.dart';
import 'package:islamic/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.appTheme == ThemeMode.dark
                  ? getSelected(AppLocalizations.of(context)!.dark)
                  : getUnSelected(AppLocalizations.of(context)!.dark)),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light
                  ? getSelected(AppLocalizations.of(context)!.light)
                  : getUnSelected(AppLocalizations.of(context)!.light)),
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
