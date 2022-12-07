import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'constants.dart';
import 'single_day.dart';
import 'package:quiver/time.dart';



class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  @override
  Widget build(BuildContext context) {
    // var d = DateUtil();
    int i,j;
    var n=daysInMonth(2022, 11);
    var wd=DateTime(2022,11,1).weekday;

    List<SingleDay> row=List<SingleDay>.filled(7, SingleDay('1','1','E'),growable: false);
    List<Row> RowList=List<Row>.filled(60, Row(children: row,),growable: false);
    //List<int> totalX=[0,0,0,0,0,0,0,0,0,0,0,0];

    //
    //print(Constants.widgetList.length);
    //print((Constants.widgetList.length/7-1).toInt());
    int hhh=(Constants.widgetList.length/7).toInt();
    print('total=$hhh');
    print('year days=${Constants.widgetList.length}');

    List<int> totalX=[0,0,0,0,0,0,0,0,0,0,0,0];
    int k=-1;
    for(int i=0;i<Constants.widgetList.length;i++){
      if( Constants.widgetList[i].num=='1') {k++;}
      if (Constants.widgetList[i].cstate=='X'){totalX[k]++;}
    }
    var sum=totalX.reduce((a, b) => a + b);
    setState(() {
      Constants.totalX=totalX;
    });

    
      for(j=0;j<hhh;j++) {
        for (i = 1; i <= 7; i++) {

          row[i-1]= Constants.widgetList[i+7*j-1];
         // print(Constants.widgetList[i+7*j].num);
         // print(row[i-1].num);
          //( SingleDay(Constants.widgetList[i+7*j].num, Constants.widgetList[i+7*j].month, 'X'));
        }
        RowList[j]=Row(children: row.toList());
        //print(RowList[j].children.first.num);
        //row.removeAt(1);row.removeAt(2);row.removeAt(3);row.removeAt(4);row.removeAt(5);row.removeAt(6);
      }

      //var rowlists=partition(RowList, 4);
      List<Row> card=[Row(children: [Text('')],)];
      for(i=0;i<=11;i++){

        var v=Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [Column (children: [Text('X=${totalX[i]}'),

             RotatedBox(
               quarterTurns: 1,
               child: Container(
                 padding:EdgeInsets.all(0.0) ,
                 width: 30*(Constants.monthLength[i+1]-Constants.monthLength[i]).toDouble(),
                 color: i.isOdd?Colors.amber:Colors.lightBlueAccent,
                 child: TextButton(
                   onPressed: (){
                     setState(() {

                     });
                   },

                   child: Text(Constants.monthNames[i],
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         fontSize: 20,
                      // backgroundColor: Colors.lightBlueAccent
                     ),

                   ),
                 ),
               ),
             )]),

             Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:

                 RowList.sublist(Constants.monthLength[i]+1,Constants.monthLength[i+1]+1)

             ),
           ],

    );
        card.add(v);
       }
      card.removeAt(0);
      // print(RowList.length);
      // SingleDay ff=RowList[5].children[0] as SingleDay;
      // print(ff.num);
      //Constants.widgetList.forEach((e) => print(e.num));


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children:( [
         Expanded(
             flex:1,child: Row(children: <Widget> [
             //  SizedBox(width: 83,)
         Text('Total X='+sum.toString()), SizedBox(width: 20,)
         ]+ Constants.header)

         ),
          Expanded (flex:12,child: SingleChildScrollView(
             child: Column(
               children: card



             ),
          ),
        ),
      ]),
    );
  }
}
