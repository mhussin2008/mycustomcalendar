import 'dart:math';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:quiver/core.dart';
import 'package:quiver/time.dart';
import 'mycustWnum.dart';
import 'mycust_num.dart';
import 'constants.dart';


class MyCustomeCalendar extends StatelessWidget {
  const MyCustomeCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var d = DateUtil();
    var n=daysInMonth(2022, 11);
    var t=DateTime(2022,11,1).weekday;
    print('t=$t');
    print('n=$n');
    int x=DateTime.november;
    print('x=$x');
    List<List<mycust_Wnum>> WidgetList= List.filled(5, List.filled(7, mycust_Wnum('5', 'X'),growable: true),growable: true);

    WidgetList[4][5]=mycust_Wnum('9', 'X');
    print(WidgetList[4][6].num);
    // for(int i=0;i<t;i++){
    //   print('i=$i');
    //   WidgetList[i][1]=mycust_Wnum('1', 'X');
    // }

    //WidgetList.forEach ((element) {element.forEach((element) {print(element.num);}); });

    //[[mycust_Wnum('0', 'H')]];

    // int j=0;
    // int r=0;
    // print(n);
    // for(int i=1;i<=n;i++){
    //   print('$i,$j,$r');
    //   WidgetList[r].add(mycust_Wnum(i.toString(),'X'));
    //   j++;
    //   if(j==7){j=0;r++;}
    // }
    WidgetList.forEachIndexed((Oindex,element) {element.forEachIndexed((Iindex,e) {
      e.num=Iindex.toString()+Oindex.toString();
      print('outer=$Oindex   inner=$Iindex');});});


print(WidgetList[1][1].hashCode);
print(WidgetList[2][3].hashCode);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
           [Center(child: Row(children :WidgetList[0])),
             Center(child: Row(children :WidgetList[1]))
           ]

           // WidgetList.map ((e) =>  Center(child: Row(
           //     mainAxisAlignment: MainAxisAlignment.center,
           //     children: e ))).toList()




      ),

    );
  }
}
