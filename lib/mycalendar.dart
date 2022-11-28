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
    var wd=DateTime(2022,11,1).weekday;

    List<SingleDay> row=List<SingleDay>.filled(7, SingleDay('1','1','E'),growable: false);
    List<Row> RowList=List<Row>.filled(60, Row(children: row,),growable: false);
    //
    //print(Constants.widgetList.length);
    //print((Constants.widgetList.length/7-1).toInt());
      for(int j=0;j<(Constants.widgetList.length/7-1).toInt();j++) {
        for (int i = 1; i <= 7; i++) {

          row[i-1]= Constants.widgetList[i+7*j-1];
         // print(Constants.widgetList[i+7*j].num);
         // print(row[i-1].num);
          //( SingleDay(Constants.widgetList[i+7*j].num, Constants.widgetList[i+7*j].month, 'X'));
        }
        RowList[j]=Row(children: row.toList());
        //print(RowList[j].children.first.num);
        //row.removeAt(1);row.removeAt(2);row.removeAt(3);row.removeAt(4);row.removeAt(5);row.removeAt(6);
      }
      // print(RowList.length);
      // SingleDay ff=RowList[5].children[0] as SingleDay;
      // print(ff.num);
      //Constants.widgetList.forEach((e) => print(e.num));


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children:( [
         Expanded(
             flex:1,child: Row(children: <Widget> [SizedBox(width: 83,)]+ Constants.header)

         ),
          Expanded (flex:12,child: SingleChildScrollView(
             child: Row(
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

                    RowList

                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
