import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/app_colors.dart';
import 'package:islamic/home/hadeth/hadeth_tab.dart';
import 'package:islamic/home/hadeth/item_hadeth_details.dart';
import 'package:islamic/home/quarn/item_sura_details.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = 'Hadeth_Screen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset("assets/images/main_background.png"),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          decoration: BoxDecoration(
              color: AppColors.white_color,
              borderRadius: BorderRadius.circular(24)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadethDetails(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }
}
