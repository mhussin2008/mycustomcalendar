import 'package:flutter/material.dart';
import 'package:mycustomcalendar/single_day.dart';


class Constants
{
  static const dayName=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
  static const dayApprev=['St','Sn','Mn','Tu','Wd','Th','Fr'];
  static const states=['N','D','X','E','H','Z'];
  static const sColors=[Colors.red,Colors.green,Colors.blue,Colors.amber,Colors.blueGrey,Colors.white];
  //static List<List<SingleDay>> widgetList= List.generate(6, (i) => List.filled(7, SingleDay('0',11.toString(), 'Z'),growable: false),growable: false);
  static List<SingleDay> widgetList=List.filled(1, SingleDay(Constants.dayApprev[0], 0.toString(), 'H'),growable: true);

}
