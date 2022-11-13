import 'package:flutter/material.dart';
import 'mycustWnum.dart';
import 'mycust_num.dart';


class MyCustomeCalendar extends StatelessWidget {
  const MyCustomeCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mycust_Wnum(0,'X'),
              mycust_Wnum(0,'E'),
              mycust_Wnum(0,'N'),
              mycust_Wnum(1,'D'),
              mycust_Wnum(2,'D'),
              mycust_Wnum(3,'D'),
              mycust_Wnum(4,'D'),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mycust_Wnum(5,'X'),
              mycust_Wnum(6,'E'),
              mycust_Wnum(7,'N'),
              mycust_Wnum(8,'D'),
              mycust_Wnum(9,'D'),
              mycust_Wnum(10,'D'),
              mycust_Wnum(11,'D'),


            ],
          ),
        ],
      ),

    );
  }
}
