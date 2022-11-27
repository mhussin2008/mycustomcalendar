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
      Constants.widgetList.add(
          SingleDay(Constants.dayApprev[h], 0.toString(), 'H'));
    }



    for(int m=1;m<12;m++) {
      for (int i = 1; i <= daysInMonth(2022, m); i++)
        {Constants.widgetList.add(
            SingleDay(i.toString(), m.toString(), m.isEven? 'X':'E'));}
    }


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: MyCalendar()),
    );
  }
}