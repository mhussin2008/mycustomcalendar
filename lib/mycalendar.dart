import 'package:collection/collection.dart';
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
    for (int j=1;j<=5;j++) {
      for (int i = 1; i <= 7; i++) {
        int d=i+(j-1)*7;
        if(d>31){break;}
        Constants.widgetList[j][i - 1] = SingleDay(d.toString(), 'X');
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      RotatedBox(
      quarterTurns: 1,
      child: Text('November',
      style: TextStyle(fontSize: 30),),
    ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            Constants.widgetList.map((e) => Row(
              mainAxisAlignment:MainAxisAlignment.center ,

              children: e,)).toList()

        ),
      ],
    );
  }
}
