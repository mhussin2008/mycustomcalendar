import 'package:flutter/material.dart';
import 'constants.dart';
import 'single_day.dart';
import 'package:quiver/time.dart';



class MyCalendar extends StatelessWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var d = DateUtil();
    var n=daysInMonth(2022, 11);
    var t=DateTime(2022,11,1).weekday;

    Constants.widgetList[0]=Constants.dayApprev.map((e) => SingleDay(e, 'H')).toList() ;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        Constants.widgetList.map((e) => Row(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: e,)).toList()

    );
  }
}
