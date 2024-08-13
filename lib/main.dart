import 'package:flutter/material.dart';
import 'package:islamic/home/hadeth/hadeth_screen.dart';
import 'package:islamic/home/home_screen.dart';
import 'package:islamic/home/quarn/sura_screen.dart';
import 'package:islamic/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraScreen.routeName: (context) => SuraScreen(),
        HadethScreen.routeName: (context) => HadethScreen(),
      },
      theme: MyThemeData.lightMode,
      locale: Locale('en'),
    );
  }
}
