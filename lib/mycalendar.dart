import 'package:flutter/material.dart';
import 'constants.dart';
import 'single_day.dart';
import 'package:quiver/time.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  @override  initState()  {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var d = DateUtil();
    int i,j;
    var n=daysInMonth(2022, 11);
    var wd=DateTime(2022,11,1).weekday;
    List<int> totalX=[0,0,0,0,0,0,0,0,0,0,0,0];
    var sum=0;
    void Update (){
      sum=totalX.reduce((a, b) => a + b);
      setState(() {
        Constants.totalX=totalX;
      });}

    List<SingleDay> row=List<SingleDay>.filled(7, SingleDay('1','1','E'),growable: false);
    List<Row> RowList=List<Row>.filled(60, Row(children: row,),growable: false);

    int hhh=(Constants.widgetList.length/7).toInt();
    print('total=$hhh');
    print('year days=${Constants.widgetList.length}');


    int k=-1;
    for(int i=0;i<Constants.widgetList.length;i++){
      if( Constants.widgetList[i].num=='1') {k++;}
      if (Constants.widgetList[i].cstate=='X'){totalX[k]++;}
    }



    
      for(j=0;j<hhh;j++) {
        for (i = 1; i <= 7; i++) {

          row[i-1]= Constants.widgetList[i+7*j-1];

        }
        RowList[j]=Row(children: row.toList());

      }
        Update();

      List<Row> card=[Row(children: [Text('')],)];
      for(i=0;i<=11;i++){

        var v=Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [Column (children: [Text('X=${totalX[i]}'),

             RotatedBox(
               quarterTurns: 1,
               child: Container(
                 padding:const EdgeInsets.all(0.0) ,
                 width: 30*(Constants.monthLength[i+1]-Constants.monthLength[i]).toDouble(),
                 color: i.isOdd?Colors.amber:Colors.lightBlueAccent,
                 child: TextButton(
                   onPressed: () async {
                      var getlist=Constants().scheduleFromMem();
                      final SharedPreferences prefs = await _prefs;
                      prefs.setStringList('data', getlist);
                      print('saved to sharedprefs');
                      print(getlist);
                     setState(() {

                     });
                   },

                   child: Text(Constants.monthNames[i],
                     textAlign: TextAlign.center,
                     style: const TextStyle(
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
