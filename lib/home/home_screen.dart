import 'package:flutter/material.dart';
import 'package:islamic/home/hadeth/hadeth_tab.dart';
import 'package:islamic/home/quarn/quarn_tab.dart';
import 'package:islamic/home/radio/radio_tab.dart';
import 'package:islamic/home/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/main_background.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: SelectedIndex,
              onTap: (index) {
                SelectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran (1).png")),
                    label: 'Quaran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                        "assets/images/quran-quran-svgrepo-com.png")),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: 'Radio'),
              ],
            ),
          ),
          body: tabs[SelectedIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    QuarnTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
  ];
}
