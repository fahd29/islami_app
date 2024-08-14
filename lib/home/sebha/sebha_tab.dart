import 'package:flutter/material.dart';
import 'package:islamic/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0;

  List<String> doaa = ["سبحان الله", "الحمد لله", "لا اله الا الله"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/head of seb7a.png',
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset('assets/images/body of seb7a.png'),
                ),
              ),
            ),
          ],
        ),
        Text(
          'عدد التسبيحات',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xffc9b496),
          ),
          child: Text(
            "$counter",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
        GestureDetector(
          onTap: () {
            counterMethod();
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.bottom_nav_color,
            ),
            child: Text(
              doaa[index],
              style: TextStyle(
                fontSize: 25,
                color: AppColors.white_color,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void counterMethod() {
    angle += 10;

    counter++;

    if (counter >= 33) {
      counter = 0;

      index++;
      if (index >= doaa.length) {
        index = 0;
      }
    }

    setState(() {});
  }
}
