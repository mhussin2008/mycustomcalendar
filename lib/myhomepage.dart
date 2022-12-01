//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mycustomcalendar/single_day.dart';
import 'package:quiver/time.dart';
import 'constants.dart';
import 'mycalendar.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    for(int h=1;h<Constants.dayApprev.length;h++){
      Constants.header.add(
         SingleDay(Constants.dayApprev[h], 0.toString(), 'H'));
    }
    //Constants.header.removeAt(0);



    for(int m=1;m<=12;m++) {
      for (int i = 1; i <= daysInMonth(2022, m); i++)
        {Constants.widgetList.add(
            SingleDay(i.toString(), m.toString(), 'E'));}
    }
    // Constants.widgetList.add(
    //     SingleDay(31.toString(), 12.toString(), 12.isEven? 'X':'E'));
    for(int i=1;i<=7;i++) {
      Constants.widgetList.add(SingleDay('0', '0', 'Z'));
    }
    print('widget list length='+Constants.widgetList.length.toString());

    Constants.widgetList.removeAt(0);


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SafeArea(child: MyCalendar()),
    );
  }
}