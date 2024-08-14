import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/app_colors.dart';
import 'package:islamic/home/quarn/item_sura_details.dart';
import 'package:islamic/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraScreen extends StatefulWidget {
  static const String routeName = 'Sura_Screen';

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String> Verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Data;
    var provider = Provider.of<AppConfigProvider>(context);
    if (Verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      provider.appTheme == ThemeMode.dark
          ? Image.asset('assets/images/dark_mode_screen.png')
          : Image.asset("assets/images/main_background.png"),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.bottom_nav_color,
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.1,
                ),
                decoration: BoxDecoration(
                    color: provider.appTheme == ThemeMode.dark
                        ? AppColors.dark_color
                        : AppColors.white_color,
                    borderRadius: BorderRadius.circular(24)),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: provider.appTheme == ThemeMode.dark
                          ? AppColors.yellow_color
                          : AppColors.bottom_nav_color,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemSuraDetails(
                      content: Verses[index],
                      index: index,
                    );
                  },
                  itemCount: Verses.length,
                ),
              ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');

    Verses = lines;
    setState(() {});
  }
}

class Data {
  String name;
  int index;

  Data({required this.name, required this.index});
}
