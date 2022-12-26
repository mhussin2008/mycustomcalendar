import 'package:flutter/material.dart';
import 'package:mycustomcalendar/single_day.dart';


class Constants
{
  static const dayName=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
  static const dayApprev=['St','Sn','Mn','Tu','Wd','Th','Fr'];
  static const states=['N','D','X','E','H','Z'];
  static const monthNames=['January','Febraury','March','April','May','June','July','August','September','October','November','December'];
  static const monthLength=[-1,3,7,12,16,21,25,29,34,38,42,47,52];
  static const sColors=[Colors.red,Colors.green,Colors.blue,Colors.amber,Colors.blueGrey,Colors.white];

  static List<SingleDay> widgetList=List.filled(1, SingleDay(Constants.dayApprev[0], 0.toString(), 'H'),growable: true);
  static List<SingleDay> header=List.filled(1, SingleDay(Constants.dayApprev[0], 0.toString(), 'H'),growable: true);
  static List<int> totalX=[0,0,0,0,0,0,0,0,0,0,0,0];
  static List<int>totalE=[0,0,0,0,0,0,0,0,0,0,0,0];

  static GlobalKey<State<StatefulWidget>> gk_Calendar=GlobalKey();

  List<String> scheduleFromMem() {
    return widgetList.map((e) => e.cstate).toList();
  }

  void scheduleToMem(List<String> newList){

    for(int i=0;i<widgetList.length;i++){
        widgetList[i]=  SingleDay(widgetList[i].num,widgetList[i].month,newList[i]);
    }
  }


}
